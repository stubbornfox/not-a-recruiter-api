json.jobs @jobs, partial: 'job', as: :job
json.paginate do
  json.total_pages  @jobs.total_pages
  json.current_page  @jobs.current_page
end
