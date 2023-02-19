# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  email                :string
#  first_name           :string
#  full_name            :string
#  inviting             :boolean
#  last_name            :string
#  password_digest      :string
#  position             :string
#  profile_picture_url  :string
#  provider             :integer
#  reset_password_token :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class User < ApplicationRecord
  has_secure_password
  has_noticed_notifications
  validates :email, presence: true, uniqueness: true # rubocop:todo Rails/UniqueValidationWithoutIndex
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> {  !google_account? && (new_record? || !password.nil?) }

  has_many :organizations_users, dependent: :destroy
  has_many :organizations, through: :organizations_users
  # rubocop:todo Rails/InverseOf
  has_one :active_organization_user, -> { where(active: true) || limit(1) }, class_name: 'OrganizationsUser', dependent: :destroy
  # rubocop:enable Rails/InverseOf
  has_one :organization, through: :active_organization_user
  has_many :jobs, dependent: :destroy
  has_many :notifications, as: :recipient

  enum :provider, %i[google_account]
  has_one_attached :profile_picture
end
