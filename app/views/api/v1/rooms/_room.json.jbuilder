json.extract! room, :id, :created_at, :updated_at
json.roomId room.id
json.roomName room.name
json.url api_v1_room_url(room, format: :json)
