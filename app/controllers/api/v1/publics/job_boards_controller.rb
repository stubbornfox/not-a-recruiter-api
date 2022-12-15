class Api::V1::Publics::JobBoardsController < ApplicationController
  before_action :set_job_board, only: %i[show]

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job_board
    @organization = Organization.find(params[:organization_id])
    @job_board = @organization.job_board
  end
end
