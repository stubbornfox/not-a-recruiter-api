class ApplicationService
  RETURNS = [
    SUCCESS = :success,
    FAILURE = :failure,
    PARTIAL_SUCCESS = :partial_success
  ].freeze

  def self.call(...)
    new(...).call
  end
end
