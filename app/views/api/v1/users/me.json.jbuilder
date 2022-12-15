json.call(@current_user, :id, :first_name, :last_name, :email, :organization_ids, :organization)
json.profile_picture rails_blob_url(@current_user.profile_picture) if @current_user.profile_picture.attached?
