# == Schema Information
#
# Table name: jobs
#
#  id                             :bigint           not null, primary key
#  applicant_requirement_location :string
#  base_salary                    :float
#  benefits                       :string           default([]), is an Array
#  categories                     :string           default([]), is an Array
#  category                       :string
#  description                    :text
#  employment_type                :string
#  location                       :string
#  max_salary                     :float            default(0.0)
#  min_salary                     :float            default(0.0)
#  needs                          :integer          default(1)
#  nice_to_have                   :text
#  responsibilities               :text
#  skills                         :string           default([]), is an Array
#  slug                           :string
#  status                         :integer          default("live")
#  title                          :string
#  type_of_employments            :string           default([]), is an Array
#  valid_through                  :datetime
#  who_you_are                    :text
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  organization_id                :bigint           not null
#  user_id                        :bigint           not null
#
# Indexes
#
#  index_jobs_on_organization_id  (organization_id)
#  index_jobs_on_slug             (slug) UNIQUE
#  index_jobs_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#  fk_rails_...  (user_id => users.id)
#
class Job < ApplicationRecord
  extend FriendlyId
  friendly_id :title_and_location, use: %i[slugged finders]

  include PgSearch::Model
  pg_search_scope :search_any_word,
                  against: %i[title location],
                  using: {
                    tsearch: { any_word: true }
                  }

  belongs_to :user
  belongs_to :organization
  has_many :candidates, dependent: :destroy

  scope :in_organization, ->(org) { where(organization: org) }

  enum  :status, %i[draft live closed], default: :live

  def title_and_location
    "#{title} in #{location}"
  end

  def should_generate_new_friendly_id?
    title_changed? || location_changed? || slug.blank?
  end

  def due_date
    valid_through || created_at + 30.days
  end

  def self.search(params)
    result = self.all
    if params[:employment_type].present?
      result = result.where(employment_type: params[:employment_type])
    end
    if params[:category].present?
      result = result.where(category:  params[:category])
    end
    if params[:location].present?
      result = result.where(location:  params[:location])
    end
    result
  end
end
