json.call(notification, :id, :params, :type, :message)

json.candidate_id notification[:params][:candidate_id]
json.job_id notification[:params][:job_id]
json.read notification.read?
json.time_ago time_ago_in_words(notification.created_at)
