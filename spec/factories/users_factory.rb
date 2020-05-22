FactoryBot.define do
  factory :user do
    email                { Faker::Internet.email }
    password             { Faker::Internet.password }

    first_name           { Faker::Name.first_name }
    middle_name          { Faker::Name.middle_name }
    last_name            { Faker::Name.last_name }

    street               { Faker::Address.street_address }
    city                 { Faker::Address.city }
    county               { Faker::Address.city_prefix }
    state                { Faker::Address.state }
    zip_code             { Faker::Address.zip_code }
    phone                { Faker::PhoneNumber.cell_phone }

    notify_via_email     { Faker::Boolean.boolean }
    notify_via_text      { Faker::Boolean.boolean }
    notify_via_app       { Faker::Boolean.boolean }

    status               { User::STATUSES.keys.sample }

    trait :with_roles do
      user_roles { build_list :user_role, 2, :with_role }
    end

    trait :with_households do
      households { build_list :household, 2 }
    end

    trait :valid do
      with_roles
    end
  end
end
