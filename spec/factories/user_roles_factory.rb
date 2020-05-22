FactoryBot.define do
  factory :user_role do

    trait :with_user do
      user { build :user, :valid }
    end

    trait :with_role do
      role { build :role, :valid }
    end

    trait :valid do
      with_user
      with_role
    end
  end
end
