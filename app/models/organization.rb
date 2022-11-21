class Organization < ApplicationRecord
  belongs_to :user

  has_many :job_boards

  enum :remote_level, [:no_remote, :some_remote, :mostly_remote, :fully_distributed]
end
