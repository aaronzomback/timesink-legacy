module Intake
  class UserEmailPasswordsController < ApplicationController

      layout "success"

    def new
      @user_email_password = UserEmailPassword.new
    end

    def create
      @user_email_password = UserEmailPassword.new(user_email_password_params)

      if @user_email_password.valid?

        # The values from the previous form step need to be
        # retrieved from the session store.
        full_params3 = user_email_password_params.merge(
          session[:full_params2]
        )

        # Here we finally carry out the ultimate objective:
        # creating a User record in the database.

        @user = User.new(session[:full_params3])
        @user.save

        # Upon successful completion of the form we need to
        # clean up the session.
        session.delete('user_name')
        session.delete('full_params')
        session.delete('full_params2')
        session.delete('full_params3')

        # keep hold of that user and begin a new session with their newly created account
        # keep hold of that user and begin a new session with their newly created account
        session[:user_id] = @user.id

        # let the user know they've signed up
        flash[:success] = "Welcome to TimeSink!"

      redirect_to root_path
      else
        render :new
      end
    end

    private

    def user_email_password_params
      params.require(:intake_user_email_password).permit(
        :email,
        :password,
        :password_confirmation
      )
    end
  end
end
