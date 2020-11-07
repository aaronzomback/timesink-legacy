class SessionsController < ApplicationController


  def new
      render :layout => 'sign'
    # we don't need any variables in here
    # because were not adding to the database - just the session in this case
  end

  def show
    redirect_to new_session_path
  end

  def create

   @email = form_params[:email]
   @password = form_params[:password]

   @user = User.find_by(email: @email).try(:authenticate, @password)

if @user.present?

 session[:user_id] = @user.id


 # go back to previous page the user was on
redirect_to cookies[:original_referrer]

  else
  render "new", :layout => 'sign'
  end
end

def destroy
  reset_session


  redirect_to root_path
end

def form_params
  params.require(:session).permit(:username, :email, :password)
end


end
