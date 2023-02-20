json.merge! @organization.attributes
json.logo_image rails_blob_url(@organization.logo_image) if @organization.logo_image.attached?
json.opening_jobs @organization.jobs do |job|
  json.call(job, :id, :slug, :title, :categories, :location)
  json.type_of_employments job.type_of_employments
end
json.job_board_id @organization.job_board&.id
json.custom_domain_url @organization.job_board&.custom_domain_url
json.hostname @organization.job_board&.hostname
json.custom_domain_valid @organization.job_board&.custom_domain_valid
