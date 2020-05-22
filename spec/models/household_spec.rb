RSpec.describe Household, type: :model do
  let(:subject) { build :household, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:first_name) }
  it { should respond_to(:middle_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:street) }
  it { should respond_to(:city) }
  it { should respond_to(:county) }
  it { should respond_to(:state) }
  it { should respond_to(:zip_code) }
  it { should respond_to(:phone) }
  it { should respond_to(:email) }
  it { should respond_to(:size) }
  it { should respond_to(:income) }
  it { should respond_to(:accept_deliveries) }
  it { should respond_to(:current) }
  it { should respond_to(:status) }

  # Associations
  it { should have_many(:eligibility_applications) }
  it { should have_many(:dietary_restrictions) }
  it { should belong_to(:user) }
  it { should belong_to(:pantry) }
  it { should have_many(:deliveries) }

  # Validations
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:user) }
  it { should validate_numericality_of(:size).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:income).is_greater_than_or_equal_to(0) }
  it { should validate_inclusion_of(:accept_deliveries).in_array(BOOLEAN) }
  it { should validate_inclusion_of(:current).in_array(BOOLEAN) }
  it { should define_enum_for(:status).with_values(described_class::STATUSES) }
end
