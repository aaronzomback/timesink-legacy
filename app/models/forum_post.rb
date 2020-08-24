class ForumPost < ApplicationRecord

  mount_uploader :image_1, ImageUploader

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :body, presence: true

end
