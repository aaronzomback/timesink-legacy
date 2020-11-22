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


    # If the submission POST contains an image, set it as an instance variable,
    # because we're going to remove it from the params
    if params[:user] && params[:user][:avatar] && !params[:user][:avatar].is_a?(String)
      # Store the UploadedFile object as an instance variable
      @image = params[:user][:avatar]
      # Remove the uploaded object from the submission POST params, since we
      # don't want to merge the whole object into the user's session
      params[:user].delete(:avatar)
    end

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
        @user.avatar_cache = session[:user_params][:avatar]
        @user.save!
      else
        @user.next_step
      end


      # After deep_merge, bring back the image
    if @image
      # This adds the image back to the Carrierwave mounted uploader (which
      # re-runs any processing/versions specified in the uploader class):
      @user.avatar = @image
      # The mounted uploader now has the image stored in the Carrierwave cache,
      # and provides us with the cache identifier, which is what we will save
      # in our session:
      session[:user_params][:avatar] = @user.avatar_cache
      session[:thumbnail_cached] = @user.avatar.url(:thumbnail)
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

    # go back to previous page the user was on
   redirect_to cookies[:original_referrer]


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
  

  def form_params
    params.require(:user).permit(:user, :name, :location, :username, :avatar, :email, :password, :password_confirmation, :newsletter)
  end
end
