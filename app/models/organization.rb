# == Schema Information
#
# Table name: organizations
#
#  id           :bigint           not null, primary key
#  date_founded :date
#  description  :text
#  facebook     :string
#  industry     :string
#  instagram    :string
#  linkedin     :string
#  locations    :string           default([]), is an Array
#  name         :string
#  remote_level :integer
#  size         :integer
#  slug         :string
#  tech_stacks  :string           default([]), is an Array
#  twitter      :string
#  website_url  :string
#  youtube      :string
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
  has_one_attached :logo_image

  has_one :job_board, dependent: :destroy
  has_many :organizations_users, dependent: :destroy
  has_many :users, through: :organizations_users
  has_many :jobs, dependent: :destroy

  enum :remote_level, %i[no_remote some_remote mostly_remote fully_distributed], default: :no_remote
  enum :size, %i[micro small medium large], default: :micro

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end
end
