require 'rails_helper'

RSpec.describe PantryShift, type: :model do
  let(:subject) { build :pantry_shift, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:date) }
  it { should respond_to(:from) }
  it { should respond_to(:to) }
  it { should respond_to(:status) }

  # Associations
  it { should belong_to(:pantry) }

  # Validations
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:from) }
  it { should validate_presence_of(:to) }
  it { should define_enum_for(:status).with_values(described_class::STATUSES) }
end
