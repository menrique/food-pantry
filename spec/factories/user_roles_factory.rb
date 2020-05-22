FactoryBot.define do
  factory :user_role do

    trait :with_user do
      user { build :user, :valid }
    end

    trait :with_role do
      role { build :role, :valid }
    end

    trait :with_households do
      households { BOOLEAN.map{|current| build :household, current: current} }
    end

    trait :with_pantries do
      pantries { BOOLEAN.map{|current| build :pantry, current: current} }
    end

    trait :with_driver_profiles do
      driver_profiles { BOOLEAN.map{|current| build :driver, current: current} }
    end

    trait :with_admin_profile do
      admin_profile { build :admin_profile }
    end

    trait :valid do
      with_user
      with_role
    end
  end
end
