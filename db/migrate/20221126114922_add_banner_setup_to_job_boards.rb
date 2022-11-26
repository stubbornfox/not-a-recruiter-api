class AddBannerSetupToJobBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :job_boards, :banner_setup, :integer
    add_column :job_boards, :banner_video_url, :string
  end
end
