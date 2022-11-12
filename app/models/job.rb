class Job < ApplicationRecord
  extend FriendlyId
  friendly_id :title_and_location, use: [:slugged, :finders]

  include PgSearch::Model
  pg_search_scope :search_any_word,
                  against: [:title, :location],
                  using: {
                    tsearch: { any_word: true }
                  }

  def title_and_location
    "#{title} in #{location}"
  end

  def should_generate_new_friendly_id?
    title_changed? || location_changed? || slug.blank?
  end
end
