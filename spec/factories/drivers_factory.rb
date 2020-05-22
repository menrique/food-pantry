FactoryBot.define do
  factory :driver do
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

    current              { Faker::Boolean.boolean }
    status               { Driver::STATUSES.keys.sample }

    trait :with_user do
      user { build :user, :valid }
    end

    trait :with_pantry do
      pantry { build :pantry, :valid }
    end

    trait :with_shifts do
      shifts { build_list :driver_shift, 2, :valid }
    end

    trait :with_available_shifts do
      available_shifts { build_list :available_driver_shift, 2, :valid }
    end

    trait :with_deliveries do
      deliveries { build_list :deliveries, 2, :with_driver_shift, :with_pantry, :with_household }
    end

    trait :valid do
      with_user
    end
  end
end
