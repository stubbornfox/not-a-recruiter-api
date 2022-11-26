class OrganizationsUser < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  after_commit :reset_active, if: :active? && :saved_change_to_active?

  private

  def reset_active
    self.class.where.not(id: id).where(user_id: user_id, active: true).update_all(active: false)
  end
end



