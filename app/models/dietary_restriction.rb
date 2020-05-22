class DietaryRestriction < ApplicationRecord
  include EnumAttribute

  TYPES = enum_attribute :restriction_type, [
      :food_allergy, :low_sodium, :gluten_free, :vegetarian, :vegan, :halal, :kosher,]

  # Associations
  belongs_to :household

  # Validations
  validates :household, presence: true
  validates :household_size, numericality: {greater_than_or_equal_to: 0}
  validates :restriction_type, inclusion: { in: TYPES.keys }
end
