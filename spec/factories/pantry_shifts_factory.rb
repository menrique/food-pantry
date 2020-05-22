FactoryBot.define do
  factory :pantry_shift do
    date               { Faker::Date.forward }
    from               { Faker::Time.backward }
    to                 { Faker::Time.forward }

    status               { PantryShift::STATUSES.keys.sample }

    trait :with_pantry do
      pantry { build :pantry, :valid }
    end

    trait :with_driver_shifts do
      driver_shifts { build_list :driver_shifts, 2, :with_driver }
    end

    trait :with_deliveries do
      driver_shifts { build_list :driver_shifts, 2, :with_driver, :with_deliveries }
    end

    trait :valid do
      with_pantry
    end
  end
end
