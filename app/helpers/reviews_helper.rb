module ReviewsHelper

  def liked_or_not
    @current_user.liked?(@review) ? 'liked' : ''
  end

end
