class Api::V1::JobsController < ApplicationController
  before_action :authorize_request
  before_action :set_job, only: %i[show update destroy]

  # GET /jobs
  def index
    @jobs = @current_user.jobs.in_organization(@current_user.organization)

    if params[:start].present? && params[:end].present?
      start_date = DateTime.parse( params[:start]).utc.to_date
      end_date = DateTime.parse( params[:end]).utc.to_date
      @jobs = @jobs.where(created_at:  start_date..end_date)
    end
    @jobs = @jobs.page(page).per(per_page)
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
    params.require(:job).permit(:title, :description, :location, :category, :valid_through, :employment_type,
                                :base_salary, :applicant_requirement_location,
                                :min_salary,:max_salary,:responsibilities,:who_you_are,:nice_to_have,
                                type_of_employments:[],benefits:[],
                                skills:[],categories:[],
                                )
  end

  def per_page
    params[:per_page] || 10
  end

  def page
    params[:page] || 1
  end
end
