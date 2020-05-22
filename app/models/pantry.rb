class Pantry < ApplicationRecord

  # Associations
  belongs_to :user
  has_many :shifts, class_name: 'PantryShift'
  has_many :bag_types
  has_many :bags
  has_many :households

  # Validations
  validates :name, presence: true
  validates :email, presence: true
  validates :user, presence: true
  validates :max_daily_bags, numericality: {greater_than_or_equal_to: 0}
end
