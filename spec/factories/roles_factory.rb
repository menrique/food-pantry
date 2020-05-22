FactoryBot.define do
  factory :role do
    name       { Faker::Company.profession }
    description { Faker::Lorem.sentence }

    trait :valid do
    end
  end
end
