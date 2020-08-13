class GalleryItemsController < ApplicationController

  def index
    @gallery_items = GalleryItem.all
  end

  def new
    @gallery_item = GalleryItem.new
  end

  def create
    @gallery_item = GalleryItem.new(form_params)
    @gallery_item.save
  end

  def show
    @gallery_item = GalleryItem.find_by_title(params[:id])
  end

  def edit
  end


  def update
    render "edit"
  end

  def destroy
  end

  def form_params
     params.require(:GalleryItem).permit(:title, :author, :description, :year, :image)
   end


end
