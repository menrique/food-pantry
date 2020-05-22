class PantryShift < ApplicationRecord
  include Stateful

  # Mixins
  STATUSES = stateful [:scheduled, :started, :completed, :cancelled,]

  # Associations
  belongs_to :pantry

  # Validations
  validates :date, presence: true
  validates :from, presence: true
  validates :to, presence: true
  validates :pantry, presence: true
  validates :status, inclusion: { in: STATUSES.keys }
end
