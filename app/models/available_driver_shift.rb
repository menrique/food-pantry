class AvailableDriverShift < ApplicationRecord
  include EnumAttribute

  # Mixins
  WEEKDAYS = enum_attribute :weekday, [:Monday, :Tuesday, :Wednesday, :Thursday, :Friday, :Saturday, :Sunday,]

  # Associations
  belongs_to :driver

  # Validations
  validates :from, presence: true
  validates :to, presence: true
  validates :driver, presence: true
  validates :weekday, inclusion: { in: WEEKDAYS.keys }
end
