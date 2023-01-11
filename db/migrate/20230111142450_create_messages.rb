class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.jsonb :reactions
      t.boolean :system, default: false
      t.boolean :saved, default: false
      t.boolean :distributed, default: false
      t.boolean :seen, default: false
      t.boolean :deleted, default: false
      t.boolean :failure, default: false

      t.timestamps
    end
  end
end
