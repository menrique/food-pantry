FactoryBot.define do
  factory :delivery do
    status               { Delivery::STATUSES.keys.sample }

    trait :with_driver do
      driver { build :driver, :valid }
    end

    trait :with_driver_shift do
      driver_shift { build :driver_shift, :valid }
    end

    trait :with_pantry do
      pantry { build :pantry, :valid }
    end

    trait :with_household do
      household { build :household, :valid }
    end

    trait :with_bags do
      bags { build_list :bag, 2, :valid }
    end

    trait :valid do
      with_driver
      with_driver_shift
      with_pantry
      with_household
    end
  end
end
