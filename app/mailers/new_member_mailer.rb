class NewMemberMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_member_mailer.greeting.subject
  #
  def greeting(user)
    # we want to use @user in our views
    @user = user

    mail to: @user.email, subject: "Welcome to TimeSink!"
  end
end
