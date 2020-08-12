class Film < ApplicationRecord

  validates :title, presence: true

  mount_uploader :CoverImage, ImageUploader

  has_one_attached :video
  has_one_attached :thumbnail

  def to_param
    title
  end 

end
