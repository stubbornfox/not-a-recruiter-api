class HomeController <  ActionController::Base
  layout 'application'

  def index
    if @job_board = JobBoard.find_by(custom_domain_url: request.host)
      @organization = @job_board.organization
      @jobs = @organization.jobs.search(params)
      @search_options = get_search_options(@jobs)
      render :job_board
      return
    elsif params[:id] && (@organization = Organization.find_by(slug: params[:id]))
      @job_board = @organization.job_board
      @jobs = @organization.jobs.search(params)
      @search_options = get_search_options(@jobs)
      render :job_board
      return
    end
  end

  private
  def get_search_options(jobs)
    OpenStruct.new(
      locations: jobs.pluck(:location).compact.uniq,
      employment_type: jobs.pluck(:employment_type).compact.uniq.map{|type| [type.humanize, type]},
      category: jobs.pluck(:category).compact.uniq,
    )
  end
end
