class CreateJobBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :job_boards do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
