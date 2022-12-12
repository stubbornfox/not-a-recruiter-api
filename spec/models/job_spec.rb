require "rails_helper"

RSpec.describe Job do
  let(:organization) { create(:organization) }
  let(:user) { create(:user) }
  let(:job) { create(:job, organization: organization, user: user) }

  it "creates a job" do
    expect(job).to be_truthy
  end
end
