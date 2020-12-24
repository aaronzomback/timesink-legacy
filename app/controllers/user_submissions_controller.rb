class UserSubmissionsController < ApplicationController

  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.friendly.find(params[:id])
  end



  def form_params
    params.permit(:user, :response, :name, :location, :title, :submission_id, :username, :avatar, :email, :password, :password_confirmation, :newsletter)
  end

end
