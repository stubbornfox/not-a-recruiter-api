class CandidateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.candidate_mailer.confirm.subject
  #
  def confirm(candidate_id)
    @candidate = Candidate.find(candidate_id)
    @job = @candidate.job

     mail to: @candidate.email, subject: "Application Confirmation - #{@job.title} at #{@job.organization.name}"
  end
end
