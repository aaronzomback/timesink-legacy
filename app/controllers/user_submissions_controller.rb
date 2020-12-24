class UserSubmissionsController < ApplicationController

  def index
    @users = User.all
    @submissions = Submission.all
  end

  def show
    @user = User.friendly.find(params[:user_id]) rescue User.find_by_username(params[:user_id])
    @submission = Submission.find_by(params[:submission_id])
  end



  def form_params
    params.permit(:user, :response, :name, :location, :username, :avatar, :email, :password, :password_confirmation, :newsletter)
  end

end
