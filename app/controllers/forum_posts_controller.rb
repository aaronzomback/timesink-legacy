class ForumPostsController < ApplicationController

  def index
    @forum_posts = ForumPost.all
  end

  def new

    if is_logged_in?
    @forum_post = ForumPost.new

  else

    flash[:error] = "You must be signed in to participate in the forum."
    redirect_to forum_posts_path
  end

  end

  def create
    @forum_post = ForumPost.new(forum_params)
    @forum_post.user = @current_user

    @forum_post.save
    flash[:success] = "Success! Your post is now in the forum."
    redirect_to forum_posts_path
  end

  def show
    @forum_post = ForumPost.friendly.find(params[:id])
    @forum_posts = ForumPost.all
  end

  def edit
  end

  def update
    render "edit"
  end

  def destroy
  end

  def forum_params
    params.require(:forum_post).permit(:title, :body, :image_1, :image_2, :image_3)
  end




end
