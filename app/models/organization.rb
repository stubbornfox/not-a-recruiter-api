class Organization < ApplicationRecord
  belongs_to :user

  enum :remote_level, [ :no_remote, :some_remote, :mostly_remote, :fully_distributed]
end
