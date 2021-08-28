class VolumesController < ApplicationController


  def index
    @volumes = Volume.all
  end

  def new
    @volume = Volume.new
  end

  def create
    @volume = Volume.new(form_params)
    @volume = Volume.save
  end

  def show
    @volume = Volume.friendly.find(params[:id])
    @films = @volume.films.find_by(params[:film_id])
  end

  def edit
  end

  def update
    render "edit"
  end

  def destroy
  end

  def form_params
   params.require(:Volume).permit(:title, :description, :cover_image)
  end

end
