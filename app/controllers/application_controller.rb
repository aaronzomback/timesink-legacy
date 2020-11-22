class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before any page loads, find the current user
  before_action :find_current_user

  # add in the method to use in 'views' , share the code used in 'views' to this controller
  helper_method :is_logged_in?

  helper_method :current_user


  helper_method :already

  def already
    "Already a member?"
  end

  def current_user
   @current_user ||= User.find_by(id: session[:user_id])
  end

  def find_current_user

    if is_logged_in?
      @current_user = User.find(session[:user_id])

    else

      @current_user = nil
    end
      @current_user
end

  # check log in status
  def check_login
    unless is_logged_in?
      # all cool
      redirect_to new_session_path
    end
  end


  # is the person logged in?

  def is_logged_in?
  session[:user_id].present?
    end
end
