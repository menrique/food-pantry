FactoryBot.define do
  factory :pantry do
    name                 { Faker::Company.name }
    description          { Faker::Lorem.sentence }

    street               { Faker::Address.street_address }
    city                 { Faker::Address.city }
    county               { Faker::Address.city_prefix }
    state                { Faker::Address.state }
    zip_code             { Faker::Address.zip_code }
    phone                { Faker::PhoneNumber.cell_phone }
    email                { Faker::Internet.email }

    max_daily_bags       { Faker::Number.between(from:100, to: 5000) }
    current              { Faker::Boolean.boolean }
    status               { Pantry::STATUSES.keys.sample }

    trait :with_user do
      user { build :user, :valid }
    end

    trait :with_shifts do
      shifts { build_list :pantry_shift, 2 }
    end

    trait :with_bag_types do
      bag_types { build_list :bag_type, 2 }
    end

    trait :with_bags do
      bags { build_list :bags, 2, :with_bag_types }
    end

    trait :with_households do
      households { build_list :households, 2, :valid }
    end

    trait :with_deliveries do
      deliveries { build_list :deliveries, 2, :with_driver_shift, :with_driver, :with_household }
    end

    trait :valid do
      with_user
    end
  end
end
