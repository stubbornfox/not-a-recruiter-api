json.call(member, :id, :first_name, :last_name, :email, :full_name, :position)

if member.profile_picture.attached?
  json.profile_picture rails_blob_url(member.profile_picture)
elsif member.profile_picture_url.present?
  json.profile_picture member.profile_picture_url
end

if member.full_name.blank?
  json.full_name "#{member.first_name} #{member.last_name}"
end
