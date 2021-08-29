class BlogPost < ApplicationRecord

  is_impressionable

    mount_uploader :cover, ImageUploader
    mount_uploader :image_1, ImageUploader
    mount_uploader :image_2, ImageUploader
    mount_uploader :image_3, ImageUploader
    mount_uploader :image_4, ImageUploader
    mount_uploader :image_5, ImageUploader


  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :author, presence: true
  validates :cover, presence: true
  validates :description, presence: true
  validates :body, presence: true

  has_many :comments, as: :commentable, dependent: :destroy


end
