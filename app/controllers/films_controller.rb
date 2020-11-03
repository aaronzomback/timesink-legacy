class FilmsController < ApplicationController

  respond_to :js, :json, :html


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
    elsif
      params[:format] == 'unlike'
      @film.unliked_by @current_user
  end
end


  def form_params
    params.require(:Film).permit(:title, :author, :cover, :video, :description, :description_body, :year, :is_top_pick)
  end

end
