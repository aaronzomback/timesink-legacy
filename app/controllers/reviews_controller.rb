class ReviewsController < ApplicationController

  respond_to :js, :html
  before_action :set_review, only: [:show, :edit, :update, :destroy, :like]




  def new


      cookies[:original_referrer] = request.original_url

    if is_logged_in?

    @film = Film.friendly.find(params[:film_id])
    # this is the form for adding a new review
    @review = Review.new

  else
    flash[:error]= "Sign in to write a review!"
    redirect_to new_session_path
  end
end

def create
  @film = Film.friendly.find(params[:film_id])

  # user must be already logged in to access 'write a new revoew'
  @review = @film.reviews.new(form_params)

  # associate the review with the current user before saving
  @review.user = @current_user

  if @review.save

  flash[:success] = "Your review has been published!"
    # go back to our film show path
    redirect_to film_path(@film)

  else
    render "new"
  end
end

def show
  @film = Film.friendly.find(params[:film_id])
  @review = Review.friendly.find(params[:id])

    render :layout => 'application'
    cookies[:original_referrer] = request.original_url
end


def destroy

end


def like
if @current_user.liked? @review
  @review.unliked_by @current_user
else
  @review.liked_by @current_user
end
respond_to do |format|
 format.js
end
end

def set_review
  @review = Review.friendly.find(params[:id])
end

def form_params
  params.require(:review).permit(:title, :body, :score)
end


end
