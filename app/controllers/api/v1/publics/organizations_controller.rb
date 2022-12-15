class Api::V1::Publics::OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show]

  def show
    render json: @organization
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
