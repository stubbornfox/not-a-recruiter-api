class Job < ApplicationRecord
  extend FriendlyId
  friendly_id :title_and_location, use: [:slugged, :finders]

  def title_and_location
    "#{title} in #{location}"
  end

  def should_generate_new_friendly_id?
    title_changed? || location_changed? || slug.blank?
  end
end
