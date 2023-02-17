class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :position, :string
    add_column :users, :inviting, :boolean
  end
end
