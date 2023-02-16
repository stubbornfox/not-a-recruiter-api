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
FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
  end
end
