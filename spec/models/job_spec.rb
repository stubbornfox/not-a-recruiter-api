# == Schema Information
#
# Table name: jobs
#
#  id                             :bigint           not null, primary key
#  applicant_requirement_location :string
#  category                       :string
#  description                    :text
#  display_salary_type            :integer
#  employment_type                :string
#  location                       :string
#  max_salary_amount              :decimal(, )      default(0.0)
#  min_salary_amount              :decimal(, )      default(0.0)
#  salary_amount                  :decimal(, )      default(0.0)
#  salary_currency                :string           default("USD")
#  salary_timeframe               :integer
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
require 'rails_helper'

RSpec.describe Job do
  let(:organization) { create(:organization) }
  let(:user) { create(:user) }
  let(:job) { create(:job, organization:, user:) }

  it 'creates a job' do
    expect(job).to be_truthy
  end
end
