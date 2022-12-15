json.call(candidate, :id, :name, :email, :phone, :location, :notes)

json.resume rails_blob_url(candidate.resume) if candidate.resume.attached?
