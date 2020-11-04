class CommentsController < ApplicationController


before_action :find_current_user

    # def new
    # end

    def create

      @comment = @commentable.comments.new(comment_params)
      @comment.user = @current_user
      if @comment.save
        respond_to do |format|
          format.html { redirect_to @commentable }
          format.js # create.js.erb
        end
      else
        redirect_to @commentable,
        flash[:error] = "Comment could not be created."
      end
    end

    def edit
      @comment = @commentable.comments.find(params[:id])
    end

    def update
      @comment = @commentable.comments.find(params[:id])
      @comment.update(comment_params)
      flash[:success] = "Editor in chief, your comment was updated!"
      redirect_to @commentable
        end


    def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy # update(user: nil, content: nil)
    flash[:success] = "D-E-S-T-R-O-Y-E-R, your comment has been erased from existence!"
    redirect_back(fallback_location: root_url)
  end

    private

    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
  end
