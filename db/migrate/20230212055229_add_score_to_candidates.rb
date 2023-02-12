class AddScoreToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :score, :float, default: 0.0
  end
end
