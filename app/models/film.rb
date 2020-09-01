class Film < ApplicationRecord

  mount_uploader :cover, ImageUploader
  mount_uploader :video, VideoUploader

  extend FriendlyId
  friendly_id :title, use: :slugged

  # one film has many reviews
  has_many :reviews

  validates :title, presence: true
  validates :author, presence: true
  validates :cover, presence: true
  validates :description, presence: true

end
