class AddFieldsToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :name, :string # rubocop:todo Rails/BulkChangeTable
    add_column :candidates, :email, :string
    add_column :candidates, :phone, :string
    add_column :candidates, :location, :string
    add_reference :candidates, :job, index: true
    add_column :candidates, :stage, :integer
  end
end
