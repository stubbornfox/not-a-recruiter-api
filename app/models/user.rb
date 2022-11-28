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
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }


  has_and_belongs_to_many :organizations
  has_many :organizations_users
  has_one :active_organization_user,  -> { where(active: true) }, class_name: 'OrganizationsUser'
  has_one :organization, through: :active_organization_user
  has_many :jobs

  has_one_attached :profile_picture
end
