class UserReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @comments = Comment.all
  end




  def form_params
    params.permit(:user, :title, :body, :username)
  end
end
