require 'droplet_kit'

class DomainRecordCreator < ApplicationService
  attr_accessor :error
  attr_reader :cname

  def initialize(cname)
    @cname = cname
  end

  def call # rubocop:todo Metrics/AbcSize
    token = Rails.application.credentials[Rails.env.to_sym][:digitalocean_token]
    for_domain = Rails.application.credentials[Rails.env.to_sym][:for_domain]
    client = DropletKit::Client.new(access_token: token)

    record = DropletKit::DomainRecord.new(type: 'CNAME', name: @cname, data: '@')

    begin
      client.domain_records.create(record, for_domain:)
      SUCCESS
    rescue DropletKit::Error => e
      @error = e.message
      Rails.logger.error(@error)
      FAILURE
    end
  end
end
