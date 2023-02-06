json.call(job, :id, :title, :description, :location, :category, :created_at, :updated_at, :due_date,
          :employment_type, :base_salary, :applicant_requirement_location, :slug, :user_id, :organization_id, :needs, :status, :employment_type)

json.display_employment_type job.employment_type.humanize
json.applicants job.candidates.count
json.display_status job.status.humanize

