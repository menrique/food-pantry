FactoryBot.define do
  factory :delivery_window do
    from                 { Faker::Time.backward }
    to                   { Faker::Time.forward }
    weekday              { DeliveryWindow::WEEKDAYS.keys.sample }

    trait :with_household do
      household { build :household, :valid }
    end

    trait :valid do
      with_household
    end
  end
end
