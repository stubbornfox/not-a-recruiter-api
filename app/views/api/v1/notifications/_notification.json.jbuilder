json.call(notification, :id, :params, :type, :message)
json.read notification.read?
json.time_ago time_ago_in_words(notification.created_at)

if notification.type == NewMessage.name
  json.message_id notification[:params][:message_id]
elsif notification.type == NewApplicantNotification.name
  json.candidate_id notification[:params][:candidate_id]
  json.job_id notification[:params][:job_id]
end
