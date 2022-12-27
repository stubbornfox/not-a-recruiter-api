class EmployerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.employer_mailer.new_applicant.subject
  #
  def new_applicant(candidate_id)
    @candidate = Candidate.find(candidate_id)
    @job = @candidate.job
    if @candidate.resume.attached?
      attachments["#{@candidate.name}_resume.#{@candidate.resume.blob.filename.extension}"] = {
        mime_type: @candidate.resume.blob.content_type,
        content: @candidate.resume.blob.download
      }
    end
    mail to: @job.user.email, subject: "New applicant - #{@candidate.name} applied for #{@job.title}"
  end
end
