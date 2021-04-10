class Review < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :film
  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 5}

  acts_as_votable

  # def review_likes
  #   @count = 0
  #
  #   reviews.all.each do |review|
  #     @count = @count + review.get_likes.quantity
  #   end
  #
  #   @count
  # end



end
