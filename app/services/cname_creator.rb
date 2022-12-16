require 'spicy-proton'

class CnameCreator < ApplicationService
  def call
    "#{Spicy::Proton.pair}-#{SecureRandom.hex}"
  end
end
