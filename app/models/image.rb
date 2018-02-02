class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  after_create_commit { ImageBroadcastJob.perform_later(self) }
end
