class AddFieldsToJobBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :job_boards, :seo_title, :string # rubocop:todo Rails/BulkChangeTable
    add_column :job_boards, :seo_description, :text
    add_column :job_boards, :url, :string
    add_column :job_boards, :custom_domain_url, :string
    add_column :job_boards, :intro, :text
    add_column :job_boards, :og_image_setup, :integer
    add_column :job_boards, :header_setup, :integer
    add_column :job_boards, :slug, :string
    add_index  :job_boards, :slug, unique: true
    add_reference :job_boards, :organization, index: true
  end
end
