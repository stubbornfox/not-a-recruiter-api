# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  email                :string
#  first_name           :string
#  full_name            :string
#  inviting             :boolean
#  last_name            :string
#  password_digest      :string
#  position             :string
#  profile_picture_url  :string
#  provider             :integer
#  reset_password_token :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password(min_length: 6) }
  end
end
