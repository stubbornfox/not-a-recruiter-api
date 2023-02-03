# == Schema Information
#
# Table name: messages
#
#  id          :bigint           not null, primary key
#  content     :text
#  deleted     :boolean          default(FALSE)
#  distributed :boolean          default(FALSE)
#  failure     :boolean          default(FALSE)
#  reactions   :jsonb
#  saved       :boolean          default(FALSE)
#  seen        :boolean          default(FALSE)
#  system      :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  room_id     :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_messages_on_room_id  (room_id)
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  has_many_attached :files

  after_create_commit :notify

  private
  def notify
    NewMessage.with(message_id: self.id).deliver(room.users - [self.user])
  end
end
