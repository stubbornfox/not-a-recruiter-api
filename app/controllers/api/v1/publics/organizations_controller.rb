class Api::V1::Publics::OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show ]

  def show
    render json: @organization
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:organization_id])
    end
end
