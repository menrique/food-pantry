class Bag < ApplicationRecord
  include EnumAttribute
  include Stateful

  # Mixins
  enum_attribute :dietary_restriction, DietaryRestriction::TYPES
  STATUSES = stateful [:pending, :prepared, :picked_up, :delivered, :discarded,]

  # Associations
  belongs_to :bag_type
  belongs_to :pantry
  belongs_to :delivery

  # Validations
  validates :bag_type, presence: true
  validates :pantry, presence: true
  validates :status, inclusion: { in: STATUSES.keys }
  validates :dietary_restriction, inclusion: { in: DietaryRestriction::TYPES.keys }
end
