json._id message.id
json.content message.content
json.senderId message.user_id.to_s
json.username message.user.first_name
json.avatar user_avatar(message.user)
json.date message.created_at.to_date
json.timestamp message.created_at.strftime('%l:%M %p')
json.distributed true
