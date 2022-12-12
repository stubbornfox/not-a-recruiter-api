FactoryBot.define do
  factory :job_board do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
  end
end
