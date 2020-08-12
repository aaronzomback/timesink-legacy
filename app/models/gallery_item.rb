class GalleryItem < ApplicationRecord

  validates :title, presence: true
  validates :image, presence: true
  validates :author, presence: true


  mount_uploader :image, ImageUploader

end
