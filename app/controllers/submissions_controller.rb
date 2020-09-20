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
    flash[:error] = "Hey ho, what'd ya know? You must be signed in to submit a film!"
  end
end

def create

  @submission = Submission.new(form_params)

    @submission.user = @current_user

  if @submission.save_and_charge

    flash[:success] = "Your film has been submitted!"
    SubmissionMailer.receipt(@submission).deliver_now
    SubmissionMailer.newsubmission(@submission).deliver_now
    redirect_to root_path


  else
    flash[:error] = "Oops, something went wrong with your submission. Please try again!"
    redirect_to root_path
  end
end


  def form_params
    params.require(:submission).permit(:title, :year, :film_length, :description, :film_link, :film_pw, :stripe_token)
  end
end
