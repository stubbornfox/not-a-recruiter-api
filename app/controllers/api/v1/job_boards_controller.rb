class Api::V1::JobBoardsController < ApplicationController
  before_action :authorize_request
  before_action :set_job_board, only: %i[show update destroy custom_domain refresh_ssl]

  # GET /job_boards
  def index
    @job_boards = JobBoard.where(organization: @current_user.organization)
  end

  # GET /job_boards/1
  def show
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
      render :show
    else
      render json: @job_board.errors, status: :unprocessable_entity
    end
  end

  def custom_domain
    if @job_board.cname.blank? && params[:custom_domain_url].present?
      cname = CnameCreator.call
      case DomainRecordCreator.call(cname)
      when DomainRecordCreator::SUCCESS
        if @job_board.update(custom_domain_url: params[:custom_domain_url], cname:)
          render :show
        else
          render json: @job_board.errors, status: :unprocessable_entity
        end
      when DomainRecordCreator::FAILURE
        render json: "Sorry, we can't generate cname at that moment", status: :unprocessable_entity
      end
    else
      if @job_board.update(custom_domain_url: params[:custom_domain_url])
        render :show
      else
        render json: @job_board.errors, status: :unprocessable_entity
      end
    end
  end

  def refresh_ssl
    if SslCreator.call(@job_board.custom_domain_url)
      if @job_board.update(custom_domain_valid: true)
        render :show
      else
        render json: @job_board.errors, status: :unprocessable_entity
      end
    else
      render json: "Please check if a DNS record exists for this domain", status: :unprocessable_entity
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
    params.require(:job_board).permit(%i[
                                        title logo_image social_media_image
                                        seo_title seo_description
                                        url custom_domain_url
                                        banner_setup banner_video_url banner_image
                                        intro header_setup og_image_setup slug
                                      ])
  end
end
