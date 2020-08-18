class SessionsController < ApplicationController

  def new
    # we don't need any variables in here
    # because were not adding to the database - just the session in this case
  end

  def create

   @username = form_params[:username]
   @password = form_params[:password]

   @user = User.find_by(username: @username).try(:authenticate, @password)

if @user.present?

 session[:user_id] = @user.id

 flash[:success] = "Welcome back to TimeSink!"

 redirect_to root_path

  else
   render "new"
   flash[:error] = "Incorrect username and/or password"
  end
end

def destroy
  reset_session

  flash[:success] = "Succesfully logged out!"

  redirect_to root_path
end

def form_params
  params.require(:session).permit(:username, :password)
end


end
