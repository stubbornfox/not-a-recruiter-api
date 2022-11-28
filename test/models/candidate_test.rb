# == Schema Information
#
# Table name: candidates
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  headline   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CandidateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
