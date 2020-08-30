class SubmissionsController < ApplicationController

  def new

    if is_logged_in?

      # the form for adding a new submission
      @submission = Submission.new

  else
    redirect_to films_path
    flash[:error] = "You must be logged in to submit a film!"
  end
end

end
