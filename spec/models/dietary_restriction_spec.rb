RSpec.describe DietaryRestriction, type: :model do
  let(:subject) { build :dietary_restriction, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:allergen) }
  it { should respond_to(:restriction_type) }
  it { should respond_to(:household_size) }

  # Associations
  it { should belong_to(:household) }

  # Validations
  it { should validate_numericality_of(:household_size).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of(:household) }
  it { should define_enum_for(:restriction_type).with_values(described_class::TYPES) }
end
