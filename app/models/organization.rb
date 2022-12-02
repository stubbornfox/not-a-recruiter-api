# == Schema Information
#
# Table name: organizations
#
#  id           :bigint           not null, primary key
#  name         :string
#  description  :text
#  website_url  :string
#  remote_level :integer
#  slug         :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Organization < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_one :job_board
  has_and_belongs_to_many :users
  has_many :organizations_users
  has_many :jobs

  enum :remote_level, [:no_remote, :some_remote, :mostly_remote, :fully_distributed], default: :no_remote

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end
end
