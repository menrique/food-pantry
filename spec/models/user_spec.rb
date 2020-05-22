RSpec.describe User, type: :model do
  let(:subject) { build :user, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:first_name) }
  it { should respond_to(:middle_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:street) }
  it { should respond_to(:city) }
  it { should respond_to(:county) }
  it { should respond_to(:state) }
  it { should respond_to(:zip_code) }
  it { should respond_to(:phone) }
  it { should respond_to(:notify_via_email) }
  it { should respond_to(:notify_via_text) }
  it { should respond_to(:notify_via_app) }
  it { should respond_to(:status) }

  # Associations
  it { should have_many(:user_roles) }
  it { should have_many(:roles).through(:user_roles) }
  it { should have_many(:households) }
  it { should have_many(:pantries) }
  it { should have_many(:driver_profiles) }
  it { should have_one(:current_household).through(:households).conditions(current: true) }
  it { should have_one(:current_pantry).through(:pantries).conditions(current: true) }
  it { should have_one(:current_driver_profile).through(:driver_profiles).conditions(current: true) }
  it { should have_one(:admin_profile) }

  # Validations
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_inclusion_of(:notify_via_email).in_array(BOOLEAN) }
  it { should validate_inclusion_of(:notify_via_text).in_array(BOOLEAN) }
  it { should validate_inclusion_of(:notify_via_app).in_array(BOOLEAN) }
  it { should define_enum_for(:status).with_values(described_class::STATUSES) }
end
