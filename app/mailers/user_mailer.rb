class UserMailer < ApplicationMailer
  def welcome user
    @user = user
    mail to: @user.email, subject: "Welcome to QRHire"
  end

  def added_to_team
    @user = params[:recipient]
    @new_user = params[:new_user]
    mail to: @user.email, subject: "Welcome as new member of #{@user.organization&.name} on Qr Hire"
  end

  def forget_password(user)
    @user = user
    mail to: @user.email, subject: "Reset your password"
  end
end
