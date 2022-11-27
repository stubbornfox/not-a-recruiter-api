class Organization < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged]

  has_one :job_board
  has_and_belongs_to_many :users
  has_many :organizations_users


  enum :remote_level, [:no_remote, :some_remote, :mostly_remote, :fully_distributed], default: :no_remote

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end
end
