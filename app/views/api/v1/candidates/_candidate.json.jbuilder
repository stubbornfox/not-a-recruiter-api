json.(candidate, :id,:name, :email, :phone, :location, :notes)

if candidate.resume.attached?
  json.resume rails_blob_url(candidate.resume)
end
