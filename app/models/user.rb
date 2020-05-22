class User < ApplicationRecord
  include Stateful

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
  # :registerable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: AuthBlacklist

  # Mixins
  STATUSES = stateful [:unverified, :active, :blocked,]

  # Associations
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :households
  has_many :pantries
  has_many :driver_profiles, class_name: 'Driver'
  has_one :current_household, -> { where(current: true) }, through: :households, class_name: 'Household'
  has_one :current_pantry, -> { where(current: true) }, through: :pantries, class_name: 'Pantry'
  has_one :current_driver_profile, -> { where(current: true) }, through: :driver_profiles, class_name: 'Driver'
  has_one :admin_profile

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :notify_via_email, inclusion: { in: BOOLEAN }
  validates :notify_via_text, inclusion: { in: BOOLEAN }
  validates :notify_via_app, inclusion: { in: BOOLEAN }
  validates :status, inclusion: { in: STATUSES.keys }
end
