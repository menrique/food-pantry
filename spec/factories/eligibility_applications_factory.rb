FactoryBot.define do
  factory :eligibility_application do
    first_name           { Faker::Name.first_name }
    middle_name          { Faker::Name.middle_name }
    last_name            { Faker::Name.last_name }

    street               { Faker::Address.street_address }
    city                 { Faker::Address.city }
    county               { Faker::Address.city_prefix }
    state                { Faker::Address.state }
    zip_code             { Faker::Address.zip_code }
    phone                { Faker::PhoneNumber.cell_phone }

    household_size       { Faker::Number.number }
    income               { Faker::Number.between(from:10000, to: 50000) }
    expire_on            { Faker::Date.forward }
    status               { EligibilityApplication::STATUSES.keys.sample }

    trait :with_household do
      household { build :household, :valid }
    end

    trait :valid do
      with_household
    end
  end
end
