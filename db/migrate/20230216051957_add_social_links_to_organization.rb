class AddSocialLinksToOrganization < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :instagram, :string
    add_column :organizations, :twitter, :string
    add_column :organizations, :facebook, :string
    add_column :organizations, :linkedin, :string
    add_column :organizations, :youtube, :string
  end
end
