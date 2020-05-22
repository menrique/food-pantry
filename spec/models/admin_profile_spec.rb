require 'rails_helper'

RSpec.describe AdminProfile, type: :model do
  let(:subject) { build :admin_profile, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:status) }

  # Associations
  it { should belong_to(:user) }

  # Validations
  it { should validate_presence_of(:user) }
  it { should define_enum_for(:status).with_values(described_class::STATUSES) }
end
