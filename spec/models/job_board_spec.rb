require "rails_helper"

RSpec.describe JobBoard do
  let(:organization) { create(:organization) }
  let(:job_board) { create(:job_board, organization: organization) }

  it "creates a job_board" do
    expect(job_board).to be_truthy
  end
end
