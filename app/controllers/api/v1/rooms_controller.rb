class Api::V1::RoomsController < ApplicationController
  before_action :authorize_request
  before_action :set_room, only: %i[ show update destroy ]

  # GET /api/v1/rooms
  # GET /api/v1/rooms.json
  def index
    @rooms = Room.includes(:participants).where(participants: { user: @current_user })
  end

  # GET /api/v1/rooms/1
  # GET /api/v1/rooms/1.json
  def show
  end

  def participants
    @participants = []
    if @current_user.organization
      @participants = User.all
      # @participants = Candidate.where(job: @current_user.organization.jobs)
    end
  end

  # POST /api/v1/rooms
  # POST /api/v1/rooms.json
  def create
    @room = Room.create_room([@current_user.id, params[:user_id]], @current_user.organization)

    if @room.valid?
      render :show, status: :created, location: api_v1_room_path(@room)
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/rooms/1
  # PATCH/PUT /api/v1/rooms/1.json
  def update
    if @room.update(room_params)
      render :show, status: :ok, location: api_v1_room_path(@room)
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/rooms/1
  # DELETE /api/v1/rooms/1.json
  def destroy
    @room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.fetch(:room, {})
    end
end
