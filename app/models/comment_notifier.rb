class CommentNotifier < ApplicationRecord
  # this is a class method, so it will be called like CommentNotifier.call(@comment, current_user) from your controller
  # this is a class method, so it will be called like CommentNotifier.call(@comment, current_user) from your controller
  def self.call(comment, current_user)
    new.call(@comment, @current_user)
  end



  # initialization stuff for the CommentNotifier instance
  attr_accessor :comment, :current_user, :blog_post
  def initialize(comment, current_user, blog_post)
    @comment = comment
    @current_user = current_user
    @blog_post = blog_post
  end

  # this is your main method where the business logic will happen.
  def call
    Rails.logger.info @comment
    Rails.logger.info @current_user
    Rails.logger.info @blog_post
    # thanks to attr_accessor, I can simple reference to commant and current_user without the @comment or @current_user

    # example guard clauses
    return unless current_user
    return unless blog_post
    return unless user_same_as_commenter

    # do other actions and checks
  end

  private

  # because we create a methods within this class, we can call on these methods since we initialized a new object in the (new.call(comment, current_user))
  def user_same_as_commenter
    current_user == comment.user
  end
end
