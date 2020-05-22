class DeliveryWindow < ApplicationRecord
  include EnumAttribute

  WEEKDAYS = enum_attribute :weekday, [:Monday, :Tuesday, :Wednesday, :Thursday, :Friday, :Saturday, :Sunday,]

  # Associations
  belongs_to :household

  # Validations
  validates :household, presence: true
  validates :from, presence: true
  validates :to, presence: true
  validates :weekday, allow_blank: true, inclusion: { in: WEEKDAYS.keys }
end
