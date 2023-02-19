class Api::V1::OrganizationsController < ApplicationController
  before_action :authorize_request
  before_action :set_organization, only: %i[show update destroy]

  # GET /organizations
  def index
    @organizations = @current_user.organizations.order(:name)

    render json: @organizations
  end

  # GET /organizations/1
  def show
    render json: @organization
  end

  def profile
    @organization = @current_user.organization
  end

  def team
    @team = @current_user.organization.users
  end

  def add_member
    @user = User.find_or_initialize_by(email: params[:email])
    new_user = @user.new_record?

    if new_user
      @user.assign_attributes(email: params[:email], position: params[:position], full_name: params[:name], password: SecureRandom.hex(8), reset_password_token: SecureRandom.hex(24))
    end

    if new_user || @user.organization_ids.exclude?(@current_user.organization.id)
      @user.organizations_users.build(organization: @current_user.organization, active: new_user)
      if @user.save
        NewMemberNotification.with(organization_id: @current_user.organization.id, new_user: new_user).deliver(@user)
      end
    end
  end

  # POST /organizations
  def create
    @organization = @current_user.organizations.new(organization_params)
    @organization.build_job_board
    @organization.organizations_users.build(user_id: @current_user.id, active: true)
    if @organization.save
      render json: @organization, status: :created, location: api_v1_organization_path(@organization)
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/1
  def update
    if @organization.update(organization_params)
      render json: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = @current_user.organizations.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def organization_params
    params.permit(:name,
      :description, :website_url, :slug,
      :remote_level, :instagram, :twitter, :facebook, :linkedin, :youtube,
      :date_founded, :industry, :size, :logo_image, locations:[], tech_stacks:[])
  end
end
