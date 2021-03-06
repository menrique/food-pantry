class Household < ApplicationRecord
  include Stateful

  # Mixins
  STATUSES = stateful [:registered, :accepted, :ineligible, :cancelled,]

  # Associations
  belongs_to :user
  has_many :eligibility_applications
  has_many :dietary_restrictions
  belongs_to :pantry
  has_many :deliveries

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :user, presence: true
  validates :size, numericality: {greater_than_or_equal_to: 0}
  validates :income, numericality: {greater_than_or_equal_to: 0}
  validates :accept_deliveries, inclusion: { in: BOOLEAN }
  validates :current, inclusion: { in: BOOLEAN }
  validates :status, inclusion: { in: STATUSES.keys }
end