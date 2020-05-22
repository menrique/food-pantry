class Driver < ApplicationRecord
  include Stateful

  # Mixins
  STATUSES = stateful [:registered, :available, :unavailable, :cancelled,]

  # Associations
  belongs_to :user
  belongs_to :pantry
  has_many :shifts, class_name: 'DriverShift'
  has_many :available_shifts, class_name: 'AvailableDriverShift'
  has_many :deliveries

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :user, presence: true
  validates :current, inclusion: { in: BOOLEAN }
  validates :status, inclusion: { in: STATUSES.keys }
end
