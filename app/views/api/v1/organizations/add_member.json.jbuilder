if @user.errors.empty?
  json.partial! "member", member: @user
else
  json.errors @user.errors
end
