class Volume < ApplicationRecord


  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :films, dependent: :destroy

  mount_uploader :cover_image, ImageUploader


end
