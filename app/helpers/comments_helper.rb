module CommentsHelper

  def liked_or_not
    @current_user.liked?(@comment) ? 'liked' : ''
  end

end
