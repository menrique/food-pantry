RSpec.describe BagType, type: :model do
  let(:subject) { build :bag_type, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:allergen) }

  # Associations
  it { should belong_to(:pantry) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:pantry) }
  it { should define_enum_for(:dietary_restriction).with_values(DietaryRestriction::TYPES) }
end
