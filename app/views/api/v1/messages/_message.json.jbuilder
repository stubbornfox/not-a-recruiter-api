json.extract! message, :id, :content, :sender_id_id, :sender_name, :reactions, :created_at, :updated_at
json.url message_url(message, format: :json)
