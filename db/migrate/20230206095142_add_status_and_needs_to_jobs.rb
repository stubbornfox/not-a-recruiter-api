class AddStatusAndNeedsToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :status, :integer, default: 1
    add_column :jobs, :needs, :integer, default: 1
  end
end
