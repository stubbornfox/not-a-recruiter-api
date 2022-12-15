# == Schema Information
#
# Table name: organizations_users
#
#  id              :bigint           not null, primary key
#  active          :boolean          default(FALSE)
#  organization_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_organizations_users_on_organization_id_and_user_id  (organization_id,user_id)
#  index_organizations_users_on_user_id_and_organization_id  (user_id,organization_id)
#
class OrganizationsUser < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  after_commit :reset_active, if: :active? && :saved_change_to_active?

  private

  def reset_active
    # rubocop:todo Rails/SkipsModelValidations
    self.class.where.not(id:).where(user_id:, active: true).update_all(active: false)
    # rubocop:enable Rails/SkipsModelValidations
  end
end
