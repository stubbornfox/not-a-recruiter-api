class Api::V1::JobBoardsController < ApplicationController
  before_action :authorize_request
  before_action :set_job_board, only: %i[ show update destroy ]

  # GET /job_boards
  def index
    @job_boards = JobBoard.where(organization_id: @current_user.organization_ids)

    render json: @job_boards.map { |job_board|
      job_board.as_json.merge({ logo_image: job_board.logo_image.attached? && url_for(job_board.logo_image) })
    }
  end

  # GET /job_boards/1
  def show
    render json: @job_board
  end

  # POST /job_boards
  def create
    @job_board = JobBoard.new(job_board_params)

    if @job_board.save
      render json: @job_board, status: :created, location: api_v1_job_board_path(@job_board)
    else
      render json: @job_board.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_boards/1
  def update
    if @job_board.update(job_board_params)
      render json: @job_board
    else
      render json: @job_board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_boards/1
  def destroy
    @job_board.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_board
      @job_board = JobBoard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_board_params
      params.require(:job_board).permit([:title, :logo_image, :seo_title, :seo_description, :url, :custom_domain_url, :intro, :header_setup, :og_image_setup, :organization_id])
    end
end
