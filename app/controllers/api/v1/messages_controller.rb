class Api::V1::MessagesController < ApplicationController
  before_action :set_message, only: %i[ show update destroy ]

  # GET /api/v1/messages
  # GET /api/v1/messages.json
  def index
    @messages = Message.where(receiver: current_user)
  end

  # GET /api/v1/messages/1
  # GET /api/v1/messages/1.json
  def show
  end

  # POST /api/v1/messages
  # POST /api/v1/messages.json
  def create
    @message = Message.new(_params)

    if @message.save
      render :show, status: :created, location: api_v1_message_path@message)
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/messages/1
  # PATCH/PUT /api/v1/messages/1.json
  def update
    if @message.update(_params)
      render :show, status: :ok, location: api_v1_message_path@message)
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/messages/1
  # DELETE /api/v1/messages/1.json
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def _params
      params.require(:message).permit(:content, :sender_id, :receiver_id, :reactions, :organization_id)
    end
end
