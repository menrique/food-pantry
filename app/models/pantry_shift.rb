class PantryShift < ApplicationRecord
  include Stateful

  # Mixins
  STATUSES = stateful [:scheduled, :started, :completed, :cancelled,]

  # Associations
  belongs_to :pantry
  has_many :driver_shifts
  has_many :deliveries, through: :driver_shifts

      # Validations
  validates :date, presence: true
  validates :from, presence: true
  validates :to, presence: true
  validates :pantry, presence: true
  validates :status, inclusion: { in: STATUSES.keys }
end
