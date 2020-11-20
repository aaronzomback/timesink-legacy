class AfterSignUpsController < ApplicationController

  include Wicked::Wizard

  layout 'success'

  steps :avatar


  def show
    @user = @current_user
    render_wizard
  end

  def update
    @user = current_user
    if @user.update_attributes(params.require(:user).permit(:avatar))
      redirect_to cookies[:original_referrer]
    else 
      render_wizard
    end
  end


end
