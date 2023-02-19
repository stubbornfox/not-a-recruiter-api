# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  email                :string
#  first_name           :string
#  full_name            :string
#  inviting             :boolean
#  last_name            :string
#  password_digest      :string
#  position             :string
#  profile_picture_url  :string
#  provider             :integer
#  reset_password_token :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  it 'creates a user' do
    expect(user).to be_truthy
  end
end
