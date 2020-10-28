class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :user, optional: true

  validates :body, presence: true

  def deleted?
    user.nil?
  end

end
