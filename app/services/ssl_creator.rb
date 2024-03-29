require 'open3'

class SslCreator < ApplicationService
  def initialize(hostname)
    @hostname = hostname
  end

  def call
    return true if Rails.env.development?
    stdout, stderr, status = Open3.capture3("sh #{Rails.root.join("app/services")}/generate_cert.sh #{@hostname}")
    status.success?
  end
end
