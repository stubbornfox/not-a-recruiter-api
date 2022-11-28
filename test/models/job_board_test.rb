# == Schema Information
#
# Table name: job_boards
#
#  id                :bigint           not null, primary key
#  title             :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  seo_title         :string
#  seo_description   :text
#  url               :string
#  custom_domain_url :string
#  intro             :text
#  og_image_setup    :integer
#  header_setup      :integer
#  slug              :string
#  organization_id   :bigint
#  banner_setup      :integer
#  banner_video_url  :string
#
require "test_helper"

class JobBoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
