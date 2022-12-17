# == Schema Information
#
# Table name: jobs
#
#  id                             :bigint           not null, primary key
#  applicant_requirement_location :string
#  category                       :string
#  description                    :text
#  display_salary_type            :integer
#  employment_type                :string
#  location                       :string
#  max_salary_amount              :decimal(, )      default(0.0)
#  min_salary_amount              :decimal(, )      default(0.0)
#  salary_amount                  :decimal(, )      default(0.0)
#  salary_currency                :string           default("USD")
#  salary_timeframe               :integer
#  slug                           :string
#  title                          :string
#  valid_through                  :datetime
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

  enum :salary_timeframe, %i[hourly daily weekly monthly annually], default: :hourly
  enum :display_salary_type, %i[fixed_amount not_shown range], default: :fixed_amount

  scope :in_organization, -> (org) { where(organization: org) }

  monetize :salary_amount, allow_nil: true
  monetize :min_salary_amount, allow_nil: true
  monetize :max_salary_amount, allow_nil: true

  after_commit :reset_salary_info, if: :saved_change_to_display_salary_type?

  def title_and_location
    "#{title} in #{location}"
  end

  def should_generate_new_friendly_id?
    title_changed? || location_changed? || slug.blank?
  end

  private

  def reset_salary_info
    unless range?
      self.min_salary_amount = 0
      self.max_salary_amount = 0
    end

    unless fixed_amount?
      self.salary_amount = 0
    end

    if not_shown?
      self.salary_timeframe = nil
      self.salary_currency = nil
    end
  end
end
