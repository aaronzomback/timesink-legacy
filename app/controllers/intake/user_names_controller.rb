module Intake
  class UserNamesController < ApplicationController

    layout "success"

    def new
      # An instance of UserProfile is created just the
      # same as you would for any Active Record object.
      @user_name = UserName.new
    end

    def create
      # Again, an instance of UserProfile is created
      # just the same as you would for any Active
      # Record object.
      @user_name = UserName.new(user_name_params)

      # The valid? method is also called just the same
      # as for any Active Record object.
      if @user_name.valid?

        # Instead of persisting the values to the
        # database, we're temporarily storing the
        # values in the session.
        session[:user_name] = {
          'name' => @user_name.name,
        }

        redirect_to new_intake_user_username_path
      else
        render :new
      end
    end

    private

    # The strong params work exactly as they would
    # for an Active Record object.
    def user_name_params
      params.require(:intake_user_name).permit(
        :name
      )
    end
  end
end
