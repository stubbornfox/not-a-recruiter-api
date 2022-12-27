# Preview all emails at http://localhost:3000/rails/mailers/candidate
class CandidatePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/candidate/confirm
  def confirm
    CandidateMailer.confirm
  end

end
