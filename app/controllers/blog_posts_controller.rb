class BlogPostsController < ApplicationController

  def index
    @blog_posts = BlogPost.all

    cookies[:original_referrer] = request.original_url

  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_params)
    @blog_post.save
  end

  def show
    @blog_post = BlogPost.includes(:comments).friendly.find(params[:id])
    cookies[:original_referrer] = request.original_url


  end

  def edit
  end

  def update
    render "edit"
  end

  def destroy
  end


  def blog_params
    params.require(:blog_post).permit(:title, :description, :body, :author, :publish_date, :cover, :image_1, :image_2, :image_3, :image_4, :image_5)
  end


end
