json.call(job, :id, :title, :description, :location, :category, :created_at, :updated_at, :due_date, :min_salary, :max_salary, :valid_through, :benefits,
          :type_of_employments, :base_salary, :applicant_requirement_location, :slug, :user_id, :organization_id, :needs, :status, :skills, :categories, :nice_to_have, :responsibilities, :who_you_are)

json.display_type_of_employments job.type_of_employments.map(&:humanize)
json.applicants job.candidates.count
json.display_status job.status.humanize
json.logo_image rails_blob_url(@current_user.organization&.job_board.logo_image) if @current_user.organization&.job_board&.logo_image.attached?
