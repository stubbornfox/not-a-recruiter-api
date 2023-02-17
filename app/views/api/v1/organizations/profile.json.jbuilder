json.merge! @organization.attributes
json.logo_image rails_blob_url(@organization.logo_image) if @organization.logo_image.attached?
json.opening_jobs @organization.jobs do |job|
  json.call(job, :id, :slug, :title, :categories, :location)
  json.type_of_employments job.type_of_employments
end
