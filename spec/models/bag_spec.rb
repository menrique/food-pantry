require 'rails_helper'

RSpec.describe Bag, type: :model do
  let(:subject) { build :bag, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:description) }
  it { should respond_to(:allergen) }

  # Associations
  it { should belong_to(:pantry) }
  it { should belong_to(:bag_type) }

  # Validations
  it { should validate_presence_of(:pantry) }
  it { should validate_presence_of(:bag_type) }
  it { should define_enum_for(:dietary_restriction).with_values(DietaryRestriction::TYPES) }
  it { should define_enum_for(:status).with_values(described_class::STATUSES) }
end
