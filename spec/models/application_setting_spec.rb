require 'rails_helper'

RSpec.describe ApplicationSetting, type: :model do
  let(:subject) { build :application_setting, :valid }

  # Factory
  it { should be_valid }
end
