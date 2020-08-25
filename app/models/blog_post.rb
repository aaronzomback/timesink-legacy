class BlogPost < ApplicationRecord

  mount_uploader :cover, ImageUploader


  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :author, presence: true
  validates :cover, presence: true
  validates :description, presence: true
  validates :body, presence: true

  has_many :comments, as: :commentable


end
