class ReviewsController < ApplicationController


  def index
    @reviews = Review.all
  end

  def new

    if is_logged_in?

    @film = Film.find_by_title(params[:film_id])
    # this is the form for adding a new review
    @review = Review.new

  else
    @film = Film.find_by_title(params[:film_id])
    redirect_to film_path(@film)
    flash[:error] = "You must be logged in to write a review."
  end
end

def create
  @film = Film.find_by_title(params[:film_id])
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
  @commentable = Review.find_by_title(params[:review_id])
  @film = Film.find_by_title(params[:film_id])
  @review = Review.find_by_title(params[:id])
end


def destroy

end

def form_params
  params.require(:review).permit(:title, :body, :score)
end


end
