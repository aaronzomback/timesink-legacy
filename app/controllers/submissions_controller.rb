class SubmissionsController < ApplicationController


  def index
    render "new"
  end

  def new
    cookies[:original_referrer] = request.original_url

    if is_logged_in?

      # the form for adding a new submission
      @submission = Submission.new
      render :layout => 'success'

  else

    flash[:error] = "Join the sink and sign in to submit a film!"
    redirect_to new_session_path

  end


end

def create

    @submission = Submission.new(form_params)

    @submission.user = @current_user

    if @submission.save

          redirect_to submission_success_path

  else
    flash[:error] = "Oops, something went wrong with your submission. Please try again!"
    render "new"
  end
end


  def form_params
    params.require(:submission).permit(:title, :year, :description, :film_link, :film_length, :film_pw, :stripe_payment_id, :response)
  end
end
