class CommentsController < ApplicationController

  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create

      @film = Film.find_by_title(params[:film_id])
      @review = Review.find_by_title(params[:review_id])
      @comment = @review.current_user.comments.new(comment_params)

      if @comment.save
        redirect_to film_review_path(@film, @review)
        flash[:success] = "Your comment has been posted!"
      else
        redirect_to :back, notice: "Your comment wasn't posted!"
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Review.find_by_id(params[:review_id]) if params[:review_id]
    end





end
