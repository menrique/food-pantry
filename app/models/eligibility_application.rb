class EligibilityApplication < ApplicationRecord
  include Stateful

  # Mixins
  STATUSES = stateful [:created, :processing, :accepted, :denied, :expired,]

  # Associations
  belongs_to :household

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :household, presence: true
  validates :household_size, numericality: {greater_than_or_equal_to: 0}
  validates :income, numericality: {greater_than_or_equal_to: 0}
  validates :status, inclusion: { in: STATUSES.keys }
end
