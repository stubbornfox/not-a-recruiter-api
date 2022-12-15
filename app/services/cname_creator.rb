require 'spicy-proton'

class CnameCreator < ApplicationService
  def call
    "#{Spicy::Proton.pair}-#{SecureRandom.hex}.#{Rails.application.credentials[Rails.env.to_sym][:for_domain]}"
  end
end
