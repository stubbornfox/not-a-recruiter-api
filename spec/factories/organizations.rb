FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
  end
end
