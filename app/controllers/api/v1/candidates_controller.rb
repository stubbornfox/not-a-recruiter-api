class Api::V1::CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show update destroy ]

  # GET /candidates
  def index
    @candidates = Candidate.all

    render json: @candidates
  end

  # GET /candidates/1
  def show
    render json: @candidate
  end

  # POST /candidates
  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      render json: @candidate, status: :created, location: api_v1_candidate_path(@candidate)
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /candidates/1
  def update
    if @candidate.update(candidate_params)
      render json: @candidate
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /candidates/1
  def destroy
    @candidate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.fetch(:candidate, {}).permit!
    end
end
