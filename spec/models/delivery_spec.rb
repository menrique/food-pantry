RSpec.describe Delivery, type: :model do
  let(:subject) { build :delivery, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:driver) }
  it { should respond_to(:driver_shift) }
  it { should respond_to(:pantry) }
  it { should respond_to(:household) }
  it { should respond_to(:status) }

  # Associations
  it { should belong_to(:driver) }
  it { should belong_to(:driver_shift) }
  it { should belong_to(:pantry) }
  it { should belong_to(:household) }
  it { should have_many(:bags) }

  # Validations
  it { should validate_presence_of(:driver) }
  it { should validate_presence_of(:driver_shift) }
  it { should validate_presence_of(:pantry) }
  it { should validate_presence_of(:household) }
  it { should define_enum_for(:status).with_values(described_class::STATUSES) }
end
