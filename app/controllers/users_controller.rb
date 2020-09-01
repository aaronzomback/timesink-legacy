class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(form_params)

    if @user.save!
      redirect_to root_path

    # keep hold of that user
    session[:user_id] = @user.id

    # let the user know they've signed up
    flash[:success] = "Welcome to TimeSink!"

    NewMemberMailer.greeting(@user).deliver_now

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
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
