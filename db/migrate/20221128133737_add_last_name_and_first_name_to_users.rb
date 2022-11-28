class AddLastNameAndFirstNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    remove_column :users, :name, :string
    remove_column :users, :username, :string
  end
end
