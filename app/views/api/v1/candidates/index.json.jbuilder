json.array! @candidates do |candidate|
  json.call(candidate, :id, :name, :email, :phone, :location, :notes, :stage, :score)
  json.job_role candidate.job.title
end
