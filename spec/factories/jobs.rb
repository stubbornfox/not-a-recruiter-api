FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    location { Faker::Address.city }
    category { Faker::Job.field }
    base_salary { 1000.0 }
    applicant_requirement_location { Faker::Address.city }
  end
end
