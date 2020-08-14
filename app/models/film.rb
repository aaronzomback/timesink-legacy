class Film < ApplicationRecord


mount_uploader :image, ImageUploader

validates :title, presence: true
validates :image, presence: true
validates :author, presence: true
validates :year, presence: true
validates :description, presence: true

def to_param
  title
end 

end
