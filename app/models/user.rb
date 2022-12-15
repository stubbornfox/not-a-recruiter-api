# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  last_name       :string
#  first_name      :string
#
class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true # rubocop:todo Rails/UniqueValidationWithoutIndex
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  has_many :organizations_users, dependent: :destroy
  has_many :organizations, through: :organizations_users
  # rubocop:todo Rails/InverseOf
  has_one :active_organization_user, -> { where(active: true) }, class_name: 'OrganizationsUser', dependent: :destroy
  # rubocop:enable Rails/InverseOf
  has_one :organization, through: :active_organization_user
  has_many :jobs, dependent: :destroy

  has_one_attached :profile_picture
end
