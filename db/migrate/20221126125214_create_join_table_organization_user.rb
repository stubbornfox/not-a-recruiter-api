class CreateJoinTableOrganizationUser < ActiveRecord::Migration[7.0]
  def change
    create_join_table :organizations, :users do |t|
      t.primary_key :id
      t.index [:organization_id, :user_id]
      t.index [:user_id, :organization_id]
      t.boolean :active, default: false
    end
  end
end
