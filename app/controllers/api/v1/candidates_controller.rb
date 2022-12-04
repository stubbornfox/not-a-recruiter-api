class Api::V1::CandidatesController < ApplicationController
  before_action :set_job
  before_action :set_candidate, only: [:show]

  def index
    @candidates = @job.candidates.where(stage: params[:stage])
  end

  def show
  end

  def update
    if @candidate.update(candidate_params)
      render json: @candidate
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  private
    def set_candidate
      @candidate = @job.candidates.find(params[:id])
    end

    def set_job
      @job = Job.find(params[:job_id])
    end
end
