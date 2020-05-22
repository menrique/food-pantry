require 'rails_helper'

RSpec.describe Pantry, type: :model do
  let(:subject) { build :pantry, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:street) }
  it { should respond_to(:city) }
  it { should respond_to(:county) }
  it { should respond_to(:state) }
  it { should respond_to(:zip_code) }
  it { should respond_to(:phone) }
  it { should respond_to(:email) }
  it { should respond_to(:max_daily_bags) }

  # Associations
  it { should belong_to(:user) }
  it { should have_many(:shifts) }
  it { should have_many(:bag_types) }
  it { should have_many(:bags) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:user) }
  it { should validate_numericality_of(:max_daily_bags).is_greater_than_or_equal_to(0) }
end
