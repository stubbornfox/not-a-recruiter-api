# == Schema Information
#
# Table name: jobs
#
#  id                             :bigint           not null, primary key
#  applicant_requirement_location :string
#  base_salary                    :float
#  category                       :string
#  description                    :text
#  employment_type                :string
#  location                       :string
#  slug                           :string
#  title                          :string
#  valid_through                  :datetime
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  organization_id                :bigint           not null
#  user_id                        :bigint           not null
#
# Indexes
#
#  index_jobs_on_organization_id  (organization_id)
#  index_jobs_on_slug             (slug) UNIQUE
#  index_jobs_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Job do
  let(:organization) { create(:organization) }
  let(:user) { create(:user) }
  let(:job) { create(:job, organization: organization, user: user) }

  it "creates a job" do
    expect(job).to be_truthy
  end
end
