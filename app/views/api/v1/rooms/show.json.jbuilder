json.partial! "room", room: @room

json.lastMessage do
  json._id ''
  json.content ''
  json.senderId @current_user.id
  json.username @current_user.first_name
  json.timestamp @room.created_at.strftime('%l:%M %p')
  json.saved false
  json.distributed false
  json.seen false
  json.new true
end
