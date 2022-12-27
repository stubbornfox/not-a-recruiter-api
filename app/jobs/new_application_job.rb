class NewApplicationJob < ApplicationJob
  queue_as :default

  def perform(candidate_id)
    EmployerMailer.new_applicant(candidate_id).deliver_now
    CandidateMailer.confirm(candidate_id).deliver_now
  end
end
