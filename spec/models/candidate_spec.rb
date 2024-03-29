# == Schema Information
#
# Table name: candidates
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  headline   :text
#  last_name  :string
#  location   :string
#  name       :string
#  notes      :text
#  phone      :string
#  score      :float            default(0.0)
#  stage      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  job_id     :bigint
#
# Indexes
#
#  index_candidates_on_job_id  (job_id)
#
require 'rails_helper'

RSpec.describe Candidate do
  let(:organization) { create(:organization) }
  let(:user) { create(:user) }
  let(:job) { create(:job, organization:, user:) }
  let(:candidate) { create(:candidate, job:) }

  it 'creates a candidate' do
    expect(candidate).to be_truthy
  end
end
