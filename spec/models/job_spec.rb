# == Schema Information
#
# Table name: jobs
#
#  id                             :bigint           not null, primary key
#  applicant_requirement_location :string
#  base_salary                    :float
#  benefits                       :string           default([]), is an Array
#  categories                     :string           default([]), is an Array
#  category                       :string
#  description                    :text
#  employment_type                :string
#  location                       :string
#  max_salary                     :float            default(0.0)
#  min_salary                     :float            default(0.0)
#  needs                          :integer          default(1)
#  nice_to_have                   :text
#  responsibilities               :text
#  skills                         :string           default([]), is an Array
#  slug                           :string
#  status                         :integer          default("live")
#  title                          :string
#  type_of_employments            :string           default([]), is an Array
#  valid_through                  :datetime
#  who_you_are                    :text
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
