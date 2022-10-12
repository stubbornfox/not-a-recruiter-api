class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.text :headline

      t.timestamps
    end
  end
end
