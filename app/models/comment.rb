class Comment < ApplicationRecord



  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :user, optional: true

  acts_as_votable

  validates :body, presence: true

    def deleted?
      user.nil?
    end

      after_commit :create_notifications, on: :create

    private


  def create_notifications
   Notification.create do |notification|
     notification.notify_type = 'comment'
     notification.actor = self.user
     notification.user = self.commentable.user
     notification.target = self
   end
 end

end
