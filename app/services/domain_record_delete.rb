require 'droplet_kit'

class DomainRecordDelete < ApplicationService
  attr_accessor :error
  attr_reader :cname

  def initialize(cname)
    @cname = cname
  end

  def call # rubocop:todo Metrics/AbcSize
    return SUCCESS if Rails.env.development?
    token = Rails.application.credentials[Rails.env.to_sym][:digitalocean_token]
    for_domain = Rails.application.credentials[Rails.env.to_sym][:for_domain]
    client = DropletKit::Client.new(access_token: token)
    begin
      client.domains.delete(name: @cname)
      SUCCESS
    rescue DropletKit::Error => e
      @error = e.message
      Rails.logger.error(@error)
      FAILURE
    end
  end
end
