module Intake
  class UserUsernamesController < ApplicationController

      layout "success"

    def new
      @user_username = UserUsername.new
    end

    def create
      @user_username = UserUsername.new(user_username_params)

      if @user_username.valid?

        # The values from the previous form step need to be
        # retrieved from the session store.
        session[:full_params] = user_username_params.merge(
           name: session['user_name']['name'],
        )

        redirect_to new_intake_user_location_path
      else
        render :new
      end
    end

    private

    def user_username_params
      params.require(:intake_user_username).permit(
        :username
      )
    end
  end
end
