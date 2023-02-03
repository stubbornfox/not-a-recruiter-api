json.extract! room, :id, :created_at, :updated_at
json.roomId room.id
json.roomName room.name

json.users room.users do |user|
  json.username user.first_name
  json._id user.id
  json.avatar user_avatar(user)
end

json.url api_v1_room_url(room, format: :json)
