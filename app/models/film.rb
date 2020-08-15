class Film < ApplicationRecord

  mount_uploader :cover, ImageUploader

  validates :title, presence: true
  validates :author, presence: true
  validates :cover, presence: true
  validates :description, presence: true

  def to_param
    title
  end 
end
