class AddSalaryInfoToJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :base_salary, :float
    add_column :jobs, :display_salary_type, :integer
    add_monetize :jobs, :salary
    add_monetize :jobs, :max_salary, currency: { present: false }
    add_monetize :jobs, :min_salary, currency: { present: false }
    add_column :jobs, :salary_timeframe, :integer
  end
end
