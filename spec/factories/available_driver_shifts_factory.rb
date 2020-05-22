FactoryBot.define do
  factory :available_driver_shift do
    from               { Faker::Time.backward }
    to                 { Faker::Time.forward }

    weekday            { AvailableDriverShift::WEEKDAYS.keys.sample }

    trait :with_driver do
      driver { build :driver, :valid }
    end

    trait :valid do
      with_driver
    end
  end
end
