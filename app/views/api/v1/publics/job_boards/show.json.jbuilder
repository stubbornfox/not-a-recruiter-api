json.call(@job_board, :id, :title, :seo_title, :seo_description, :url, :custom_domain_url, :intro, :header_setup,
          :banner_setup, :og_image_setup, :banner_video_url, :banner_image, :organization_id)

json.slug @job_board.slug || @job_board.organization.slug
json.logo_image rails_blob_url(@job_board.logo_image) if @job_board.logo_image.attached?
json.social_media_image rails_blob_url(@job_board.social_media_image) if @job_board.social_media_image.attached?
json.banner_image rails_blob_url(@job_board.banner_image) if @job_board.banner_image.attached?
