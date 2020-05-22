class Delivery < ApplicationRecord
  include Stateful

  # Mixins
  STATUSES = stateful [:picked_up, :delivered, :failed,]

  # Associations
  belongs_to :driver
  belongs_to :driver_shift
  belongs_to :household
  belongs_to :pantry
  has_many :bags

  validates :driver, presence: true
  validates :driver_shift, presence: true
  validates :household, presence: true
  validates :pantry, presence: true
  validates :status, inclusion: { in: STATUSES.keys }
end
