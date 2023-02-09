json.call(job, :id, :title, :description, :location, :category, :created_at, :updated_at, :due_date,
          :type_of_employments, :base_salary, :applicant_requirement_location, :slug, :user_id, :organization_id, :needs, :status)

json.display_type_of_employments job.type_of_employments.map(&:humanize)
json.applicants job.candidates.count
json.display_status job.status.humanize

