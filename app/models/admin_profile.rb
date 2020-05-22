class AdminProfile < ApplicationRecord
  include Stateful

  # Mixins
  STATUSES = stateful [:active, :revoked,]

  # Associations
  belongs_to :user

  # Validations
  validates :user, presence: true
end
