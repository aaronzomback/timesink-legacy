class FilmsController < ApplicationController

  respond_to :js, :html
  before_action :set_film, only: [:show, :edit, :update, :destroy, :like]


  def index

    @films = Film.all

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
    @film.punch(request)


  end

  def edit
  end

  def update
    render "edit"
  end

  def destroy
  end


  def like
  if @current_user.liked? @film
    @film.unliked_by @current_user
  else
    @film.liked_by @current_user
  end
  respond_to do |format|
   format.js
 end
end


  private

  def set_film
      @film = Film.friendly.find(params[:id])
    end


  def form_params
    params.require(:Film).permit(:title, :author, :cover, :video, :trailer, :description, :description_body, :year, :is_top_pick)
  end

end
