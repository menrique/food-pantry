describe Role, type: :model do
  let(:subject) { build :role, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:name) }
  it { should respond_to(:description) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
