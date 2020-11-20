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
    @user.update_attributes(params.require(:user).permit(:avatar))
    render_wizard @user
  end


end
