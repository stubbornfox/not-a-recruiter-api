class JobsController <  ActionController::Base
  layout 'application'
  before_action :default_domain, if: -> { params[:default_domain] }
  before_action :custom_domain, if: -> { !params[:default_domain] }

  def index
    @jobs = @organization.jobs.search(params)
    @search_options = get_search_options(@jobs)
  end

  def show
    @home_path = request.url.split('/')[0...-1].join('/')
    @job = @organization.jobs.find_by(slug: params[:job_slug])
  end

  private
  def get_search_options(jobs)
    OpenStruct.new(
      locations: [['All locations', '']] + jobs.pluck(:location).compact.uniq,
      employment_type: [['All types', '']] + jobs.pluck(:employment_type).compact.uniq.map{|type| [type.humanize, type]},
      category:  [['All categories', '']] + jobs.pluck(:category).compact.uniq,
    )
  end

  def default_domain
    @organization = Organization.find_by(slug: params[:organization_slug])
    @job_board = @organization.job_board
  end

  def custom_domain
    if JobBoard.custom_domains.include?(request.host)
      @job_board = JobBoard.find_by(custom_domain_url: request.host)
      @organization = @job_board.organization
    else
      render nothing: true, status: :ok
    end
  end
end
