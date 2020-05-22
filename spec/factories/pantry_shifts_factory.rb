FactoryBot.define do
  factory :pantry_shift do
    date               { Faker::Date.forward }
    from               { Faker::Time.backward }
    to                 { Faker::Time.forward }

    status               { PantryShift::STATUSES.keys.sample }

    trait :with_pantry do
      pantry { build :pantry, :valid }
    end

    trait :valid do
      with_pantry
    end
  end
end
