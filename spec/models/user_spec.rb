require "rails_helper"

RSpec.describe User do
  let(:user) { create(:user) }

  it "creates a user" do
    expect(user).to be_truthy
  end
end
