class Review < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :film
  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :body, length: {minimum: 5}

  acts_as_votable


  private




end
