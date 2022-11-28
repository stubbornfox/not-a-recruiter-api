# == Schema Information
#
# Table name: organizations
#
#  id           :bigint           not null, primary key
#  name         :string
#  description  :text
#  website_url  :string
#  remote_level :integer
#  slug         :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
