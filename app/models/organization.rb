class Organization < ApplicationRecord
  belongs_to :user

  has_one :job_board

  enum :remote_level, [:no_remote, :some_remote, :mostly_remote, :fully_distributed]
end
