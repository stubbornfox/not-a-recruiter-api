json.extract! room, :id, :created_at, :updated_at
json.roomId room.id
json.roomName room.name
json.avatar user_avatar(room.recipient(@current_user))
json.users room.users do |user|
  json.username user.first_name
  json._id user.id
  json.avatar user_avatar(user)
end

if room.last_message
  json.lastMessage do
    json._id room.last_message.id.to_s
    json.content room.last_message.content
    json.senderId room.last_message.user_id.to_s
    json.username room.last_message.user.first_name
    json.timestamp room.last_message.created_at.strftime('%l:%M %p')
    json.saved room.last_message.save
    json.distributed room.last_message.distributed
    json.seen room.last_message.seen
    json.new true
  end
end

json.url api_v1_room_url(room, format: :json)
