class Reviews::CommentsController < CommentsController

    before_action :set_commentable
    before_action :find_current_user

    def new
     @comment = Comment.new(commentable: @commentable)
   end


  private

  def set_commentable
    @film = Film.friendly.find(params[:film_id])
    @review = Review.friendly.find(params[:review_id])
    @commentable = Review.friendly.find(params[:review_id])
  end
end
