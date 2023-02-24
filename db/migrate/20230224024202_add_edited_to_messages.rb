class AddEditedToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :edited, :datetime
    remove_column :messages, :deleted
    add_column :messages, :deleted, :datetime
  end
end
