json.array! @participants do |participant|
  json.call(participant, :id, :first_name, :last_name)
  json.name participant.first_name
end
