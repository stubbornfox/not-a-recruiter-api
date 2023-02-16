json.call(candidate, :id, :name, :email, :phone, :location, :notes, :stage, :score, :headline)

json.resume rails_blob_url(candidate.resume) if candidate.resume.attached?
json.job_role candidate.job.title
json.job_type_of_employments candidate.job.type_of_employments&.map(&:humanize)
json.job_categories candidate.job.categories
