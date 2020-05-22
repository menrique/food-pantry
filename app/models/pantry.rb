class Pantry < ApplicationRecord
  include Stateful

  # Mixins
  STATUSES = stateful [:created, :open, :closed]

  # Associations
  belongs_to :user
  has_many :shifts, class_name: 'PantryShift'
  has_many :bag_types
  has_many :bags
  has_many :households
  has_many :deliveries

  # Validations
  validates :name, presence: true
  validates :email, presence: true
  validates :user, presence: true
  validates :current, inclusion: { in: BOOLEAN }
  validates :max_daily_bags, numericality: {greater_than_or_equal_to: 0}
end
