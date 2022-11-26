json.(job_board, :id, :title, :logo_image, :social_media_image, :seo_title, :seo_description, :url, :custom_domain_url, :intro, :header_setup, :og_image_setup, :organization_id)
if job_board.logo_image.attached?
  json.logo_image rails_blob_url(job_board.logo_image)
end
if job_board.social_media_image.attached?
  json.social_media_image rails_blob_url(job_board.social_media_image)
end
