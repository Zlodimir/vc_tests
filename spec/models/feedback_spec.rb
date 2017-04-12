require 'rails_helper'

# Test suite for the Feedback model
RSpec.describe Feedback, type: :model do
  # Validation tests
  # ensure columns email, text are present before saving
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:text) }

  it "has a valid factory" do
    expect(FactoryGirl.create(:feedback)).to be_valid
  end
end
