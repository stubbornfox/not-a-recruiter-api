json.merge! @organization.attributes
json.opening_jobs @organization.jobs do |job|
  json.call(job, :id, :slug, :title, :categories, :location)
  json.type_of_employments job.type_of_employments
end
