class BlogPostsController < ApplicationController

  def index
    @blog_posts = BlogPost.all
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_params)
    @blog_post.save
  end

  def show
    @blog_post = BlogPost.friendly.find(params[:blog_post_id])
  end

  def edit
  end

  def update
    render "update"
  end

  def destroy
  end


  def blog_params
    params.require(:blo_post).permit(:title, :description, :body, :author, :cover, :image_1, :image_2, :image_3, :image_4, :image_5)
  end


end
