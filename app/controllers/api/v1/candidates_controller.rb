class Api::V1::CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[show update]

  def index
    if params[:job_id]
      @candidates = Candidate.where(job_id: params[:job_id])
    else
      @candidates = Candidate.all
    end
  end

  def show
  end

  def update
    if @candidate.update(candidate_params)
      render status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:notes)
  end
end
