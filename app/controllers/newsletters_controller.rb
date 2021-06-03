class NewslettersController < ApplicationController

  def create
    @newsletter = Newsletter.create(newsletter_params) 
  end 

  def newsletter_params 
    params.require(:newsletter).permit(:email)
  end 
end
