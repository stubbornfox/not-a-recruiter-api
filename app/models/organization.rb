# == Schema Information
#
# Table name: organizations
#
#  id           :bigint           not null, primary key
#  description  :text
#  name         :string
#  remote_level :integer
#  slug         :string
#  website_url  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_organizations_on_slug     (slug) UNIQUE
#  index_organizations_on_user_id  (user_id)
#
class Organization < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[slugged finders]

  has_one :job_board, dependent: :destroy
  has_many :organizations_users, dependent: :destroy
  has_many :users, through: :organizations_users
  has_many :jobs, dependent: :destroy

  enum :remote_level, %i[no_remote some_remote mostly_remote fully_distributed], default: :no_remote

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end
end
