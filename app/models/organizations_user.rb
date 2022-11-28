# == Schema Information
#
# Table name: organizations_users
#
#  organization_id :bigint           not null
#  user_id         :bigint           not null
#  id              :bigint           not null, primary key
#  active          :boolean          default(FALSE)
#
class OrganizationsUser < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  after_commit :reset_active, if: :active? && :saved_change_to_active?

  private

  def reset_active
    self.class.where.not(id: id).where(user_id: user_id, active: true).update_all(active: false)
  end
end



