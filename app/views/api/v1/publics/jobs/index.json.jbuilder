json.array! @jobs do |job|
  json.call(job, :id, :title, :description, :location, :category, :created_at,
            :updated_at, :valid_through, :employment_type, :base_salary,
            :applicant_requirement_location, :slug, :user_id, :organization_id)
  json.employment_type job.employment_type.humanize
end
