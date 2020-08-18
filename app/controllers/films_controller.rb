class FilmsController < ApplicationController

  def index
    @films = Film.all
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(form_params)
    @film = Film.save
  end

  def show
    @film = Film.find_by_title(params[:id])
    @review = Review.find_by_title(params[:review_id])
  end

  def edit
  end

  def update
    render "edit"
  end

  def destroy
  end


  def form_params
    params.require(:Film).permit(:title, :author, :cover, :description, :year, :is_top_pick)
  end

end
