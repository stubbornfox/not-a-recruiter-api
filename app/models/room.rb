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
  has_many :messages, dependent: :destroy
  belongs_to :organization

  scope :recent, -> { joins(:messages).order(updated_at: :desc) }

  def self.create_room(user_ids, organization)
    p = Participant.joins(:room).group('room_id')
        .having("array_agg(participants.user_id order by participants.user_id)::int[] = array#{user_ids.sort}")
        .select('room_id').where('rooms.organization_id': organization.id)
    if p.present?
      p.first.room
    else
      room = Room.new(organization: organization)
      user_ids.each do |user_id|
        room.participants.new(user_id: user_id)
      end
      room.name = User.find(user_ids.last).first_name
      room.save
      room
    end
  end

  def recipient(sender)
    (users - [sender]).first || sender
  end

  def last_message
    messages.last
  end
end
