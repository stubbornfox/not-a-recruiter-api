# == Schema Information
#
# Table name: rooms
#
#  id              :bigint           not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_rooms_on_organization_id  (organization_id)
#
require 'rails_helper'

RSpec.describe Room, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
