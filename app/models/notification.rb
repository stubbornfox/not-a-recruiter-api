# == Schema Information
#
# Table name: notifications
#
#  id             :bigint           not null, primary key
#  params         :jsonb
#  read_at        :datetime
#  recipient_type :string           not null
#  type           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  recipient_id   :bigint           not null
#
# Indexes
#
#  index_notifications_on_read_at    (read_at)
#  index_notifications_on_recipient  (recipient_type,recipient_id)
#
class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, class_name: "User"

  def message
    if type == NewApplicantNotification.name
      candidate = Candidate.find(params[:candidate_id])
      "#{candidate.name} applied to the #{candidate.job.title} position"
     elsif type == NewMessage.name
      message = Message.find(params[:message_id])
      "You have new messages from #{message.user.first_name}"
    end
  end
end
