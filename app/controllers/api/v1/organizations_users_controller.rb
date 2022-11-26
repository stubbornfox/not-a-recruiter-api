class Api::V1::OrganizationsUsersController < ApplicationController
  before_action :authorize_request
  before_action :set_organizations_user

  def active
    if @organizations_user.update(active: true)
      render json: { acitve: true }, status: :ok
    else
      render json: { acitve: false }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizations_user
      @organizations_user = @current_user.organizations_users.find_by(organization_id: params[:organization_id])
    end
end
