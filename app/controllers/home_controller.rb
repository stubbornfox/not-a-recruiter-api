class HomeController < ApplicationController
  def index
    custom_domain_url = request.original_url
    if @job_board = JobBoard.find_by_custom_domain_url(custom_domain_url)
      @organization = @job_board.organization
      render :job_board
      return
    elsif params[:id]
      @organization = Organization.find_by(slug: params[:id])
      @job_board = @organization.job_board
      render :job_board
      return
    end
  end
end
