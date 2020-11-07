class BlogPosts::CommentsController < CommentsController

    before_action :set_commentable

    def new
     @comment = Comment.new(commentable: @commentable)
   end


  private

  def set_commentable
    @commentable = BlogPost.friendly.find(params[:blog_post_id])
  end
end
