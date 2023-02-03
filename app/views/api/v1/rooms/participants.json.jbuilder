json.array! @participants do |participant|
  json.call(participant, :id, :first_name, :last_name, :email)
  json.name participant.first_name
  if participant.profile_picture.attached?
    json.profile_picture rails_blob_url(participant.profile_picture)
  elsif participant.profile_picture_url.present?
    json.profile_picture participant.profile_picture_url
  end
end
