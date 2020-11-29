class CommentsController < ApplicationController


respond_to :js, :html


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
        redirect_to cookies[:original_referrer]
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
         redirect_to cookies[:original_referrer]
        end


    def destroy
    @comment = @commentable.comments.find(params[:id])
    Notification.find_by_target_id(@comment).destroy rescue ''
    @comment.destroy
    flash[:success] = "D-E-S-T-R-O-Y-E-R, your comment has been erased from existence!"
    redirect_back(fallback_location: root_url)
  end

  def like

  @comment = Comment.find(params[:id])

  if @current_user.liked? @comment
    @comment.unliked_by @current_user
  else
    @comment.liked_by @current_user
  end
  respond_to do |format|
   format.js
 end
end




private


    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
  end
