class Film < ApplicationRecord


  acts_as_votable
  acts_as_punchable


  mount_uploader :cover, ImageUploader
  mount_uploader :video, VideoUploader
  mount_uploader :trailer, VideoUploader

   def score
    self.get_upvotes.size - self.get_downvotes.size
  end

  extend FriendlyId
  friendly_id :title, use: :slugged

  # one film has many reviews
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :cover, presence: true
  validates :description, presence: true

end
