class BlogPost < ApplicationRecord

  mount_uploader :cover, ImageUploader

  validates :title, presence: true
  validates :author, presence: true
  validates :cover, presence: true
  validates :description, presence: true
  validates :body, presence: true

  has_many :comments, as: :commentable

  def to_param
    title
  end

end
