class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :website_url
      t.integer :remote_level
      t.string :slug, index: { unique: true }
      t.references :user, index: true

      t.timestamps
    end
  end
end
