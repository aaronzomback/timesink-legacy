class ForumPostsController < ApplicationController

  def index
    @forum_post = ForumPost.all
  end

  def new
    @forum_post = ForumPost.new
  end

  def create
    @forum_post = ForumPost.new(forum_params)
    @forum_post.save
  end

  def show
    @forum_post = ForumPost.find_by_title(params[:forum_post_id])
  end

  def edit
  end

  def update
    render "edit"
  end

  def destroy
  end



  def forum_params
    params.require(:ForumPost).permit(:title, :body, :image_1, :image_2, :image_3)
  end


end
