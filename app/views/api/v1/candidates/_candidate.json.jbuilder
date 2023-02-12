json.call(candidate, :id, :name, :email, :phone, :location, :notes, :stage, :score, :headline)

json.resume rails_blob_url(candidate.resume) if candidate.resume.attached?
json.job_role candidate.job.title
