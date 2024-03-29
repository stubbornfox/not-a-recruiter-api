# == Schema Information
#
# Table name: job_boards
#
#  id                  :bigint           not null, primary key
#  banner_setup        :integer
#  banner_video_url    :string
#  cname               :string
#  custom_domain_url   :string
#  custom_domain_valid :boolean          default(FALSE)
#  description         :text
#  header_setup        :integer
#  intro               :text
#  og_image_setup      :integer
#  seo_description     :text
#  seo_title           :string
#  slug                :string
#  title               :string
#  url                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  organization_id     :bigint
#
# Indexes
#
#  index_job_boards_on_organization_id  (organization_id)
#  index_job_boards_on_slug             (slug) UNIQUE
#
class JobBoard < ApplicationRecord
  has_one_attached :logo_image
  has_one_attached :social_media_image
  has_one_attached :banner_image

  belongs_to :organization

  enum :og_image_setup, %i[og_default og_custom og_none], default: :og_default
  enum :header_setup, %i[logo_only name_only logo_and_name], default: :logo_and_name
  enum :banner_setup, %i[no_banner image_banner video_banner], default: :no_banner

  before_update :update_custom_domain_status, if: :custom_domain_url_changed?
  after_commit :config_custom_domain, if: :saved_change_to_custom_domain_url?

  def hostname
    "#{cname}.#{Rails.application.credentials[Rails.env.to_sym][:for_domain]}" if cname.present?
  end

  def seo_description_content
    seo_description || "View our open jobs at #{organization.name}"
  end

  def seo_title_content
    seo_title || "Jobs at #{organization.name}"
  end

  def self.custom_domains
    pluck(:custom_domain_url).compact_blank.uniq
  end

  private

  def update_custom_domain_status
    if custom_domain_url.blank?
      DeleteDomainRecordJob.perform_later(self.cname)
      self.cname = nil
    end
    self.custom_domain_valid = false
  end

  def config_custom_domain
    ServerConfig.call(custom_domain_url_previously_was, custom_domain_url) if Rails.env.production?
  end
end
