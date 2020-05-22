describe UserRole, type: :model do
  let(:subject) { build :user_role, :valid }

  # Factory
  it { should be_valid }

  # Associations
  it { should belong_to(:role) }
  it { should belong_to(:user) }

  # Validations
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:user) }
end
