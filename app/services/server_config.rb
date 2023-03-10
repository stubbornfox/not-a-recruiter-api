require 'open3'

class ServerConfig < ApplicationService
  def initialize(old_domain, new_domain)
    @old_domain = old_domain
    @new_domain = new_domain
  end

  def call
    Open3.capture3("sh #{Rails.root.join("app/services")}/remove_site.sh #{@old_domain}") if @old_domain.present?
    if @new_domain.present?
      stdout, stderr, status = Open3.capture3("sh #{Rails.root.join("app/services")}/generate_site.sh #{@new_domain}")
      status.success?
    else
      true
    end
  end
end
