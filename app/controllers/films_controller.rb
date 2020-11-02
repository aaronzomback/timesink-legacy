class FilmsController < ApplicationController

  respond_to :js, :html, :json

  def index

    @films = Film.all

      # to order films by descending amount of reviews received
    @films = Film.joins("left join reviews on reviews.film_id = films.id").group('films.id').order('count(reviews.id) desc')

    cookies[:original_referrer] = request.original_url

  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(form_params)
    @film = Film.save
  end

  def show
    @film = Film.friendly.find(params[:id])
    @review = Review.find_by_id(params[:review_id])

    cookies[:original_referrer] = request.original_url
  end

  def edit
  end

  def update
    render "edit"
  end

  def destroy
  end

  def like
  @film = Film.friendly.find(params[:id])
   if params[:format] == 'like'
     @film.liked_by @current_user
   elsif params[:format] == 'unlike'
     @film.unliked_by @current_user
   end
 end


  def form_params
    params.require(:Film).permit(:title, :author, :cover, :video, :description, :description_body, :year, :is_top_pick)
  end

end
