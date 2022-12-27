class UserMailer < ApplicationMailer
  default from: "qhirer@gmail.com"

  def welcome user
    @user = user
    mail to: @user.email, subject: "Welcome to QRHire"
  end
end
