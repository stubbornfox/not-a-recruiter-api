json.(job,
  :id,
  :title,
  :description,
  :location,
  :category,
  :created_at,
  :updated_at,
  :valid_through,
  :employment_type,
  :display_salary_type,
  :salary_amount,
  :max_salary_amount,
  :min_salary_amount,
  :salary_currency,
  :salary_timeframe,
  :applicant_requirement_location,
  :slug,
  :user_id,
  :organization_id
)

json.employment_type job.employment_type.humanize
