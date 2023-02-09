class AddColumnsToJobs < ActiveRecord::Migration[7.0]
  def change
    change_table(:jobs) do |t|
      t.column :skills, :string, array: true, default: []
      t.column :categories, :string, array: true, default: []
      t.column :type_of_employments, :string, array: true, default: []
      t.column :benefits, :string, array: true, default: []
      t.column :min_salary, :float, default: 0.0
      t.column :max_salary, :float, default: 0.0
      t.column :responsibilities, :text
      t.column :who_you_are, :text
      t.column :nice_to_have, :text
    end
  end
end
