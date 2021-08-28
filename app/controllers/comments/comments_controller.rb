class Comments::CommentsController < CommentsController

  before_action :set_commentable
  before_action :find_current_user

  def new
   @comment = @current_user.comments.new(commentable: @commentable)
 end



  private

  def set_commentable
    @commentable = Comment.find_by_id(params[:comment_id])
  end

end
