class DonationMailer < ApplicationMailer


  def ThankYou(donation)
    # we want to use @user in our views
    @donation = donation

    mail to: @donation.email, subject: "Thank You!"
  end

  def newdonation(donation)
    @donation = donation

    mail to: "info@timesink.tv", subject: "New donation!"
  end

end