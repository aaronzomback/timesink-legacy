class Film < ApplicationRecord

  mount_uploader :cover, ImageUploader

  # one film has many reviews
  has_many :reviews

  validates :title, presence: true
  validates :author, presence: true
  validates :cover, presence: true
  validates :description, presence: true

  def to_param
    title
  end
end
