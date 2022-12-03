json.partial! @job, as: :job
json.inbox @job.candidates.inbox.count
json.screen @job.candidates.screen.count
json.interview @job.candidates.interview.count
json.decide @job.candidates.decide.count
json.offer @job.candidates.offer.count
json.hired @job.candidates.hired.count
json.archived @job.candidates.archived.count
