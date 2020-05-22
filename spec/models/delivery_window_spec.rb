require 'rails_helper'

RSpec.describe DeliveryWindow, type: :model do
  let(:subject) { build :delivery_window, :valid }

  # Factory
  it { should be_valid }

  # Attributes
  it { should respond_to(:from) }
  it { should respond_to(:to) }
  it { should respond_to(:weekday) }

  # Associations
  it { should belong_to(:household) }

  # Validations
  it { should validate_presence_of(:from) }
  it { should validate_presence_of(:to) }
  it { should validate_presence_of(:household) }
  it { should define_enum_for(:weekday).with_values(described_class::WEEKDAYS) }
end
