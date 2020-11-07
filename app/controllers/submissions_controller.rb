class SubmissionsController < ApplicationController


  def index
    @submissions = Submission.all
  end

  def new


    cookies[:original_referrer] = request.original_url

    if is_logged_in?

      # the form for adding a new submission
      @submission = Submission.new

  else
    redirect_to new_session_path
    flash[:error] = "You must be signed in to submit a film!"
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
    params.require(:submission).permit(:title, :year, :film_pw, :description, :film_length, :film_link, :stripe_payment_id)
  end
end
