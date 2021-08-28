class AccountsController < ApplicationController

  before_action :find_current_user

def show
  redirect_to edit_account_path
end

def edit

end

def update

  if @current_user.update!(form_params)
    flash[:success] = "Your account was updated!"
  else
  flash[:error] = "oops, not updated!"
  end

  render "edit"
end

def form_params
  params.require(:user).permit(:avatar, :location, :name, :username, :email, :password)
end


end
