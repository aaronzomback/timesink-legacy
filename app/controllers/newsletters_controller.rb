class NewslettersController < ApplicationController

  layout "success"

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    if @newsletter.save
      redirect_to donation_success_path
    else
      render "new"
    end
  end

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end
