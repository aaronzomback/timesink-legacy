class NewsletterSignUpMailer < ApplicationMailer

  def newsletter_greeting(newsletter)
    @newsletter = newsletter

    mail to: @newsletter.email, subject: "Welcome to the TimeSink Newsletter!"
  end

  def new_subscription(newsletter)
    @newsletter = newsletter

    mail to: "hello@timesinkpresents.com", subject: "New newsletter subscriber!"
  end
end
