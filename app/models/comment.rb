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
     notification.notify_type = 'commentable'
       notification.actor = self.user
       notification.user = self.user
       notification.target = self
       notification.second_target = self.commentable
   end
 end

end
