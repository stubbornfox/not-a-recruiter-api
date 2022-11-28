# == Schema Information
#
# Table name: job_boards
#
#  id                :bigint           not null, primary key
#  title             :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  seo_title         :string
#  seo_description   :text
#  url               :string
#  custom_domain_url :string
#  intro             :text
#  og_image_setup    :integer
#  header_setup      :integer
#  slug              :string
#  organization_id   :bigint
#  banner_setup      :integer
#  banner_video_url  :string
#
class JobBoard < ApplicationRecord
  has_one_attached :logo_image
  has_one_attached :social_media_image
  has_one_attached :banner_image

  belongs_to :organization

  enum :og_image_setup, [:default, :custom, :nothing], default: :default
  enum :header_setup, [:logo_only, :name_only, :logo_and_name], default: :logo_and_name
  enum :banner_setup, [:no_banner, :image, :video], default: :no_banner
end
