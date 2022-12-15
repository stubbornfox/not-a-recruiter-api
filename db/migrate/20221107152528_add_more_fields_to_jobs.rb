class AddMoreFieldsToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :valid_through, :datetime # rubocop:todo Rails/BulkChangeTable
    add_column :jobs, :employment_type, :string
    add_column :jobs, :base_salary, :float
    add_column :jobs, :applicant_requirement_location, :string
  end
end
