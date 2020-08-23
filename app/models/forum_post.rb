class ForumPost < ApplicationRecord

  mount_uploader :image_1, ImageUploader

  belongs_to :user

  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :body, presence: true

  def to_param
    title
  end
end
