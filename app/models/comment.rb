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
<<<<<<< HEAD
     notification.notify_type = 'commentable'
       notification.actor = self.user
       notification.user = self.user
       notification.target = self
       notification.second_target = self.commentable
=======
     notification.notify_type = 'comment'
     notification.actor = self.user
     notification.user = self.user
     notification.target = self
     notification.second_target = self.commentable
>>>>>>> a855195bb96b416cd57e54f57c284b2e116ed7d9
   end
 end

end
