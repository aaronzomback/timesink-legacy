class NestedCommentsController < ApplicationController


  def root_comments
    @nested_comments.where(reply_comment: nil)
  end

  def create
    @film = Film.friendly.find(params[:id])
  comment = @film.comments.create(comment_params)

  if comment.valid? && comment.save
    flash[:notice] = 'Comment Added'
    session.delete(:comment)
    redirect_to post_path(film, anchor: 'comment')
  else
    session[:comment] = comment
    flash[:alert] = Array(comment.errors).to_sentence
    redirect_to new_film_comment_path(film, comment_id: params["comment"]["reply_comment"], anchor: 'comment')
  end
end

private

def comment_params
  params.require(:comment).permit(:body, :post_id, :reply_comment)
end


end
