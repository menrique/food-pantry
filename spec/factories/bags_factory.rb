FactoryBot.define do
  factory :bag do
    description          { Faker::Lorem.sentence }
    allergen             { Faker::Food.name }

    dietary_restriction  { DietaryRestriction::TYPES.keys.sample }

    trait :with_bag_type do
      bag_type { build :bag_type, :valid }
    end

    trait :with_pantry do
      pantry { build :pantry, :valid }
    end

    trait :with_delivery do
      delivery { build :delivery, :valid }
    end

    trait :valid do
      with_pantry
      with_bag_type
    end
  end
end
