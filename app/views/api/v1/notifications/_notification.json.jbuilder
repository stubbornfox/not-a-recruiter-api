json.call(notification, :id, :params)

json.time_ago time_ago_in_words(notification.created_at)
