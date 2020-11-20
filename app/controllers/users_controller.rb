class UsersController < ApplicationController

  layout "success"

  def index
    @users = User.all
  end


  def new
    session[:user_params] ||= {}
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
  end


  def create


  # Merge existing session with POST params
  session[:user_params].deep_merge!(params[:user].to_unsafe_h) if params[:user]

    # Instantiate model from newly merged session/params
   @user = User.new(session[:user_params])
       # Increment the current step in the session form
   @user.current_step = session[:user_step]



      if params[:back_button]
        @user.previous_step
      elsif @user.last_step?
        # Re-populate the Carrierwave uploader's cache with the cache identifier
        # saved in the session
        @user.save
      else
        @user.next_step
      end


      session[:user_step] = @user.current_step


      if @user.new_record?
      render "new"

      else

    # remove the onboarding session
    session[:user_step] = session[:user_params] = nil

    # keep hold of that user and begin a new session with their newly created account
    session[:user_id] = @user.id

    # let the user know they've signed up
    flash[:success] = "Welcome to TimeSink!"

    # continue to avatar upload option
    redirect_to after_sign_up_path(:avatar)


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
    flash[:success] = "Your account has been deleted"
    redirect_to root_path
  end

  protected
 def after_sign_up_path_for(resource)
   after_register_path(:avatar)
 end



  def form_params
    params.require(:user).permit(:user, :name, :location, :username, :avatar, :email, :password, :password_confirmation, :submissions)
  end
end
