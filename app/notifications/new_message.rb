# To deliver this notification:
#
# NewApplicantNotification.with(post: @post).deliver_later(current_user)
# NewApplicantNotification.with(post: @post).deliver(current_user)

class NewMessage < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :action_cable
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  #   post_path(params[:post])
  # end

  def custom_stream
    "user_#{recipient.id}"
  end
end
