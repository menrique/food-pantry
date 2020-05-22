FactoryBot.define do
  factory :driver_shift do
    date               { Faker::Date.forward }
    from               { Faker::Time.backward }
    to                 { Faker::Time.forward }

    status               { DriverShift::STATUSES.keys.sample }

    trait :with_driver do
      driver { build :driver, :valid }
    end

    trait :with_pantry_shift do
      pantry_shift { build :pantry_shift, :valid }
    end

    trait :with_deliveries do
      deliveries { build_list :deliveries, 2, :with_driver, :with_pantry, :with_household }
    end

    trait :valid do
      with_driver
      with_pantry_shift
    end
  end
end
