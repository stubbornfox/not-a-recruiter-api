class JobsController <  ActionController::Base
  layout 'application'
  before_action :default_domain, if: -> { params[:custom] == false }
  before_action :custom_domain, if: -> { params[:custom] == true }

  def index
    @jobs = @organization.jobs.search(params)
    @search_options = get_search_options(@jobs)
  end

  def show
    @job = @organization.jobs.find_by(slug: params[:job_slug])
  end

  private
  def get_search_options(jobs)
    OpenStruct.new(
      locations: jobs.pluck(:location).compact.uniq,
      employment_type: jobs.pluck(:employment_type).compact.uniq.map{|type| [type.humanize, type]},
      category: jobs.pluck(:category).compact.uniq,
    )
  end

  def default_domain
    @organization = Organization.find_by(slug: params[:organization_slug])
    @job_board = @organization.job_board
  end

  def custom_domain
    @job_board = JobBoard.find_by(custom_domain_url: request.host)
    @organization = @job_board.organization
  end
end
