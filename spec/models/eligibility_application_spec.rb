RSpec.describe EligibilityApplication, type: :model do
  let(:subject) { build :eligibility_application, :valid }

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
  it { should respond_to(:household_size) }
  it { should respond_to(:income) }
  it { should respond_to(:expire_on) }
  it { should respond_to(:status) }

  # Associations
  it { should belong_to(:household) }

  # Validations
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_numericality_of(:household_size).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:income).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of(:household) }
  it { should define_enum_for(:status).with_values(described_class::STATUSES) }
end
