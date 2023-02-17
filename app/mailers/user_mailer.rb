class UserMailer < ApplicationMailer
  def welcome user
    @user = user
    mail to: @user.email, subject: "Welcome to QRHire"
  end

  def added_to_team
    @user = params[:recipient]
    mail to: @user.email, subject: "Welcome as new member of #{@user.organization&.name} on Qr Hire"
  end
end
