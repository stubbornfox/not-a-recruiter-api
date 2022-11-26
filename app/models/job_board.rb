class JobBoard < ApplicationRecord
  has_one_attached :logo_image
  has_one_attached :social_media_image
  has_one_attached :banner_image

  belongs_to :organization

  enum :og_image_setup, [:default, :custom, :nothing]
  enum :header_setup, [:logo_only, :name_only, :logo_and_name]
end
