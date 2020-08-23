class Review < ApplicationRecord

  belongs_to :film
  belongs_to :user

  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :body, length: {minimum: 10}
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def to_param
    title
  end

end
