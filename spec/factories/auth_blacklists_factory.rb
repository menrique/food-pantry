FactoryBot.define do
  factory :auth_blacklist do
    jti { SecureRandom.uuid }

    trait :valid do
    end
  end
end
