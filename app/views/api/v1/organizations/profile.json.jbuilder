json.call(@organization, :id, :description, :name, :remote_level, :slug, :website_url, :created_at, :updated_at)
json.opening_jobs @organization.jobs do |job|
  json.call(job, :id, :slug, :title, :categories, :location)
  json.type_of_employments job.type_of_employments
end
