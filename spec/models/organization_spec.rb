# == Schema Information
#
# Table name: organizations
#
#  id           :bigint           not null, primary key
#  description  :text
#  facebook     :string
#  instagram    :string
#  linkedin     :string
#  name         :string
#  remote_level :integer
#  slug         :string
#  twitter      :string
#  website_url  :string
#  youtube      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_organizations_on_slug     (slug) UNIQUE
#  index_organizations_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Organization do
  let(:organization) { create(:organization) }

  it 'creates a organization' do
    expect(organization).to be_truthy
  end
end
