class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
        render :layout => 'success'
  end

  def create
    @user = User.new(form_params)

    if @user.save

    # keep hold of that user
    session[:user_id] = @user.id


    # go back to previous page the user was on
   redirect_to cookies[:original_referrer]

    # let the user know they've signed up
    flash[:success] = "Welcome to TimeSink!"

    NewMemberMailer.greeting(@user).deliver_now
    NewMemberMailer.newmember(@user).deliver_now

    else
      render "new"
    end
end

  def show
    @user = User.find_by_username(params[:id])
  end

  def destroy
    @user = User.destroy(params[:id])
  end



  def form_params
    params.require(:user).permit(:name, :location, :username, :avatar, :email, :password, :password_confirmation, :submissions)
  end
end
