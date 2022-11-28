# == Schema Information
#
# Table name: jobs
#
#  id                             :bigint           not null, primary key
#  title                          :string
#  description                    :text
#  location                       :string
#  category                       :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  valid_through                  :datetime
#  employment_type                :string
#  base_salary                    :float
#  applicant_requirement_location :string
#  slug                           :string
#  user_id                        :bigint           not null
#  organization_id                :bigint           not null
#
require "test_helper"

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
