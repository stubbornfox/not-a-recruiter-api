json.call(@current_user, :id, :first_name, :last_name, :email, :organization_ids, :organization, :full_name, :profile_picture_url, :provider)
if @current_user.profile_picture.attached?
  json.profile_picture rails_blob_url(@current_user.profile_picture)
elsif @current_user.profile_picture_url.present?
  json.profile_picture @current_user.profile_picture_url
end
if @current_user.first_name.blank? && @current_user.full_name.present?
  json.first_name @current_user.full_name.split(" ").first
end
