# == Schema Information
#
# Table name: job_boards
#
#  id                  :bigint           not null, primary key
#  banner_setup        :integer
#  banner_video_url    :string
#  cname               :string
#  custom_domain_url   :string
#  custom_domain_valid :boolean          default(FALSE)
#  description         :text
#  header_setup        :integer
#  intro               :text
#  og_image_setup      :integer
#  seo_description     :text
#  seo_title           :string
#  slug                :string
#  title               :string
#  url                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  organization_id     :bigint
#
# Indexes
#
#  index_job_boards_on_organization_id  (organization_id)
#  index_job_boards_on_slug             (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe JobBoard do
  let(:organization) { create(:organization) }
  let(:job_board) { create(:job_board, organization:) }

  it 'creates a job_board' do
    expect(job_board).to be_truthy
  end
end
