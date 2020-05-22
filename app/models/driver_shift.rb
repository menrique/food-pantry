class DriverShift < ApplicationRecord
  include Stateful

  # Mixins
  STATUSES = stateful [:scheduled, :started, :completed, :cancelled,]

  # Associations
  belongs_to :driver
  belongs_to :pantry_shift
  has_many   :deliveries

  # Validations
  validates :date, presence: true
  validates :from, presence: true
  validates :to, presence: true
  validates :driver, presence: true
  validates :pantry_shift, presence: true
  validates :status, inclusion: { in: STATUSES.keys }
end
