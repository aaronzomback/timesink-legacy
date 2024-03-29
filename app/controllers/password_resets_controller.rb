class PasswordResetsController < ApplicationController

  layout "success"

  def new

  end

  def create
    @user = User.find_by_email(params[:email])
    @user.send_password_reset if @user
    flash[:success] = "E-mail sent with password reset instructions."
    redirect_to reset_path
  end

  def edit
  @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hour.ago
    flash[:notice] = 'Your password reset session has expired'
    redirect_to new_password_reset_path
  elsif @user.update(user_params)
    flash[:success] = "Your password has been reset!"
    redirect_to new_blob_path
  else
    render :edit
  end
end

private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
