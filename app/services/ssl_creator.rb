require 'open3'

class SSLCreator < ApplicationService
  def initialize(hostname)
    @hostname = hostname
  end

  def call
    stdout, stderr, status = Open3.capture3("sh ./generate_cert.sh")
  end
end
