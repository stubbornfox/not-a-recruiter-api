require "rails_helper"

RSpec.describe Candidate do
  let(:organization) { create(:organization) }
  let(:user) { create(:user) }
  let(:job) { create(:job, organization: organization, user: user) }
  let(:candidate) { create(:candidate, job: job) }

  it "creates a candidate" do
    expect(candidate).to be_truthy
  end
end
