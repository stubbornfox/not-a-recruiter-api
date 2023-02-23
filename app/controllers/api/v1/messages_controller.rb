class Api::V1::MessagesController < ApplicationController
  before_action :set_message, only: %i[ show update destroy ]
  before_action :set_room

  # GET /api/v1/messages
  # GET /api/v1/messages.json
  def index
    @messages = @room.messages
  end

  # GET /api/v1/messages/1
  # GET /api/v1/messages/1.json
  def show
  end

  # POST /api/v1/messages
  # POST /api/v1/messages.json
  def create
    @message = @room.messages.new(_params)

    if @message.save
      render :show, status: :created, location: api_v1_room_message_path(@room, @message)
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/messages/1
  # PATCH/PUT /api/v1/messages/1.json
  def update
    if @message.update(_params)
      render :show, status: :ok, location: api_v1_room_message_path(@room, @message)
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

    def set_room
      @room = Room.find(params[:room_id])
    end

    # Only allow a list of trusted parameters through.
    def _params
      params.require(:message).permit(:content, :user_id, reactions: {})
    end
end
