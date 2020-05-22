FactoryBot.define do
  factory :admin_profile do
    status               { AdminProfile::STATUSES.keys.sample }

    trait :with_user do
      user { build :user, :valid }
    end

    trait :valid do
      with_user
    end
  end
end
