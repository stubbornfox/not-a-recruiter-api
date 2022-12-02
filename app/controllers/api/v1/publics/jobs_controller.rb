class Api::V1::Publics::JobsController < ApplicationController
  before_action :set_job, only: %i[ show ]

  def index
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @organization = Organization.find(params[:organization_id])
      @job = @organization.jobs.find(params[:id])
    end
end
