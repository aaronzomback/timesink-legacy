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
            flash[:success] = "Your comment was posted!"
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
      if @comment.update(comment_params)
        respond_to do |format|
          format.html { redirect_to @commentable }
          format.js # create.js.erb
            flash[:success] = "Editor in chief, your comment was updated!"
        end
    else
       redirect_back(fallback_location: root_url)
     end
    end


    def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy # update(user: nil, content: nil)
    redirect_back(fallback_location: root_url)
  end

    private

    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
  end
