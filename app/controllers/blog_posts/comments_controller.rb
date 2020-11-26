class BlogPosts::CommentsController < CommentsController

    before_action :set_commentable
    before_action :find_current_user

    def new
     @comment = Comment.new(commentable: @commentable)
   end


  private

  def set_commentable
    @commentable = BlogPost.friendly.find(params[:blog_post_id])
  end
end
