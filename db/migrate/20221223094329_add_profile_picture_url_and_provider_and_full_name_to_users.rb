class AddProfilePictureUrlAndProviderAndFullNameToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table(:users) do |t|
      t.column :full_name, :string
      t.column :provider, :integer
      t.column :profile_picture_url, :string
    end
  end
end
