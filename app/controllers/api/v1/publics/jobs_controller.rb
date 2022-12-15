class Api::V1::Publics::JobsController < ApplicationController
  before_action :set_organization
  before_action :set_job, only: %i[show apply]

  def index
    @jobs = @organization.jobs
  end

  def show
  end

  def apply
    @candidate = @job.candidates.new(candidate_params)
    if @candidate.save
      render json: {}, status: :created
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  def set_job
    @job = @organization.jobs.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:name, :email, :phone, :location, :resume)
  end
end
