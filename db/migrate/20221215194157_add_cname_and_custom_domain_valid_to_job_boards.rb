class AddCnameAndCustomDomainValidToJobBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :job_boards, :cname, :string
    add_column :job_boards, :custom_domain_valid, :boolean, default: false
  end
end
