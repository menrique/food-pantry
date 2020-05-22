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
