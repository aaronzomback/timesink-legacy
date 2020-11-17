class UsersController < ApplicationController

  def index
    render "new"
  end

  def new

    session[:user_params] ||= {}
    @user = User.new
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    render :layout => 'success'
  end

  def create

    session[:user_params]
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    if params[:back_button]
      @user.previous_step
    elsif @user.last_step?
      @user.save
    else
      @user.next_step
    end
    session[:user_step] = @user.current_step
    if @user.new_record?
      render "new"
    else

    # keep hold of that user
    session[:user_id] = @user.id

    # let the user know they've signed up
    flash[:success] = "Welcome to TimeSink!"

    # go back to previous page the user was on
   redirect_to root_path


    NewMemberMailer.greeting(@user).deliver_now
    NewMemberMailer.newmember(@user).deliver_now


    end
end

  def show
    @user = User.find_by_username(params[:id])
  end

  def destroy
      session[:user_id] = nil
      @user = User.find_by_username(params[:id]).destroy

      redirect_to root_path, notice: "User deleted."
end



  def user_params
    params.require(:user).permit(:user, :name, :location, :username, :avatar, :email, :password, :password_confirmation, :submissions)
  end
end
