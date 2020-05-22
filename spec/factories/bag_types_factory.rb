FactoryBot.define do
  factory :bag_type do
    name                 { Faker::Lorem.word }
    description          { Faker::Lorem.sentence }
    allergen             { Faker::Food.name }

    dietary_restriction  { DietaryRestriction::TYPES.keys.sample }

    trait :with_pantry do
      pantry { build :pantry, :valid }
    end

    trait :valid do
      with_pantry
    end
  end
end
