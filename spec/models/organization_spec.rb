require "rails_helper"

RSpec.describe Organization do
  let(:organization) { create(:organization) }

  it "creates a organization" do
    expect(organization).to be_truthy
  end
end
