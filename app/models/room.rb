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
class Room < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants
  has_many :messages
  belongs_to :organization

  scope :recent, -> { order(updated_at: :desc) }

  def self.create_room(user_ids, organization)
    room = Room.new(organization: organization)
    user_ids.each do |user_id|
      room.participants.new(user_id: user_id)
    end
    room.name = User.find(user_ids.last).first_name
    room.save
    room
  end
end
