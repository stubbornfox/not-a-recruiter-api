# Preview all emails at http://localhost:3000/rails/mailers/employer
class EmployerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/employer/new_applicant
  def new_applicant
    EmployerMailer.new_applicant
  end

end
