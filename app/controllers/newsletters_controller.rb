class NewslettersController < ApplicationController

  layout "success"

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    if @newsletter.save
      NewsletterSignUpMailer.newsletter_greeting(@newsletter).deliver_now
      NewsletterSignUpMailer.new_subscription(@newsletter).deliver_now
      redirect_to newsletter_thanks_path
    else
      render "new"
    end
  end

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end
