class AuthBlacklist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Blacklist
  self.table_name = 'auth_blacklists'

  # Validations
  validates :jti, presence: true
end
