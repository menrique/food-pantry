FactoryBot.define do
  factory :dietary_restriction do
    allergen             { Faker::Food.ingredient }
    household_size       { Faker::Number.number }
    restriction_type     { DietaryRestriction::TYPES.keys.sample }

    trait :with_household do
      household { build :household, :valid }
    end

    trait :valid do
      with_household
    end
  end
end

