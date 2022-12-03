class Api::V1::JobsController < ApplicationController
  before_action :authorize_request
  before_action :set_job, only: %i[ show update destroy applicants]

  # GET /jobs
  def index
    @jobs = @current_user.jobs.in_organization(@current_user.organization)
  end

  # GET /jobs/1
  def show
  end

  # POST /jobs
  def create
    @job = @current_user.jobs.build(job_params.merge(organization: @current_user.organization))

    if @job.save
      render json: @job, status: :created, location: api_v1_job_path(@job)
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :description, :location, :category, :valid_through, :employment_type, :base_salary, :applicant_requirement_location)
    end
end
