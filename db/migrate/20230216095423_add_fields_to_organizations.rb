class AddFieldsToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :tech_stacks, :string, array: true, default: []
    add_column :organizations, :locations, :string, array: true, default: []
    add_column :organizations, :date_founded, :date
    add_column :organizations, :size, :integer
    add_column :organizations, :industry, :string
  end
end
