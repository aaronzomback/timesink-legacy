module FilmsHelper


    def liked_or_not
      @current_user.liked?(@film) ? 'liked' : ''
    end

end
