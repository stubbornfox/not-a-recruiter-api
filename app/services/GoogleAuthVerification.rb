require 'googleauth'

class GoogleAuthVerification < ApplicationService
  attr_reader :id_token

  def initialize(id_token)
    @id_token = id_token
  end

  def call
    begin
      Google::Auth::IDTokens.verify_oidc(id_token, aud: Rails.application.credentials[Rails.env.to_sym][:google_auth_client_id])
      SUCCESS
    rescue Google::Auth::IDTokens::SignatureError => e
      @error = e.message
      Rails.logger.error(@error)
      FAILURE
    end
  end
end
