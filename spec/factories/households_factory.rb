FactoryBot.define do
  factory :household do
    first_name           { Faker::Name.first_name }
    middle_name          { Faker::Name.middle_name }
    last_name            { Faker::Name.last_name }

    street               { Faker::Address.street_address }
    city                 { Faker::Address.city }
    county               { Faker::Address.city_prefix }
    state                { Faker::Address.state }
    zip_code             { Faker::Address.zip_code }
    phone                { Faker::PhoneNumber.cell_phone }
    email                { Faker::Internet.email }

    size                 { Faker::Number.number }
    income               { Faker::Number.between(from:10000, to: 50000) }
    accept_deliveries    { Faker::Boolean.boolean }
    status               { Household::STATUSES.keys.sample }

    trait :with_user do
      user { build :user, :valid }
    end

    trait :with_eligibility_applications do
      eligibility_applications { build_list :eligibility_application, 2 }
    end

    trait :with_dietary_restrictions do
      dietary_restrictions { build_list :dietary_restriction, 2 }
    end

    trait :with_pantry do
      pantry { build :pantry, :valid }
    end

    trait :valid do
      with_user
    end
  end
end
