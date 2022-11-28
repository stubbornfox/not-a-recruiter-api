json.(@current_user, :id, :first_name, :last_name, :email, :organization_ids, :organization)
if @current_user.profile_picture.attached?
  json.profile_picture rails_blob_url(@current_user.profile_picture)
end
