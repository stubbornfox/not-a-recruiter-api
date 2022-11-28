# == Schema Information
#
# Table name: jobs
#
#  id                             :bigint           not null, primary key
#  title                          :string
#  description                    :text
#  location                       :string
#  category                       :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  valid_through                  :datetime
#  employment_type                :string
#  base_salary                    :float
#  applicant_requirement_location :string
#  slug                           :string
#  user_id                        :bigint           not null
#  organization_id                :bigint           not null
#
class Job < ApplicationRecord
  extend FriendlyId
  friendly_id :title_and_location, use: [:slugged, :finders]

  include PgSearch::Model
  pg_search_scope :search_any_word,
                  against: [:title, :location],
                  using: {
                    tsearch: { any_word: true }
                  }


  belongs_to :user
  belongs_to :organization

  scope :in_organization, -> (org) { where(organization: org) }

  def title_and_location
    "#{title} in #{location}"
  end

  def should_generate_new_friendly_id?
    title_changed? || location_changed? || slug.blank?
  end
end
