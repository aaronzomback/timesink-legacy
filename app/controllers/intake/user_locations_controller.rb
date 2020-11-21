module Intake
  class UserLocationsController < ApplicationController

      layout "success"


    def new
      @user_location = UserLocation.new
    end

    def create
      @user_location = UserLocation.new(user_location_params)

      if @user_location.valid?

        # The values from the previous form step need to be
        # retrieved from the session store.
        session[:full_params2] = user_location_params.merge(
          session[:full_params]
        )

        redirect_to new_intake_user_email_password_path
      else
        render :new
      end
    end

    private

    def user_location_params
      params.require(:intake_user_location).permit(
        :location
      )
    end
  end
end
