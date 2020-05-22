class BagType < ApplicationRecord
  include EnumAttribute

  # Mixins
  enum_attribute :dietary_restriction, DietaryRestriction::TYPES

  # Associations
  belongs_to :pantry

  # Validations
  validates :name, presence: true
  validates :pantry, presence: true
  validates :dietary_restriction, inclusion: { in: DietaryRestriction::TYPES.keys }
end