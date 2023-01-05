class Api::V1::NotificationsController < ApplicationController
  before_action :authorize_request
  before_action :set_job, only: %i[show update destroy]

  # GET /jobs
  def index
    @notifications = @current_user.notifications
  end
end
