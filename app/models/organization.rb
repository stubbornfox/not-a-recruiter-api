class Organization < ApplicationRecord
  has_one :job_board
  has_and_belongs_to_many :users
  has_many :organizations_users

  enum :remote_level, [:no_remote, :some_remote, :mostly_remote, :fully_distributed]
end
