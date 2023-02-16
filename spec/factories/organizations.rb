# == Schema Information
#
# Table name: organizations
#
#  id           :bigint           not null, primary key
#  description  :text
#  facebook     :string
#  instagram    :string
#  linkedin     :string
#  name         :string
#  remote_level :integer
#  slug         :string
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
