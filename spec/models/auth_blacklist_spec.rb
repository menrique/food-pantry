RSpec.describe AuthBlacklist, type: :model do
  let(:subject) { build :auth_blacklist, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:jti) }

  # Validations
  it { should validate_presence_of(:jti) }
end
