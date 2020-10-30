class Comment < ApplicationRecord


  after_commit :create_notifications, on: :create

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :user, optional: true

  validates :body, presence: true

  def deleted?
    user.nil?
  end

  def create_notifications
   Notification.create do |notification|
     notification.notify_type = 'comment'
     notification.actor = self.user
     notification.user = self.commentable.user
     notification.target = self
     # notification.second_target = self.blog_post
   end
 end

end
