class Api::V1::NotificationsController < ApplicationController
  before_action :authorize_request
  before_action :set_notification, only: %i[mark_as_read]

  # GET /jobs
  def index
    @notifications = @current_user.notifications
  end

  def mark_as_read
    if @notification.mark_as_read!
      render json: {}, status: :ok
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  private
  def set_notification
    @notification = Notification.find(params[:id])
  end
end
