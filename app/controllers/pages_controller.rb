class PagesController < ApplicationController




  def home
  end

  def info
    render :layout => 'infounderline'
  end

  def donate
    render :layout => 'donateunderline'
  end

  def terms
  end

  def submit
  end

  def privacy_policy
  end

  def cookies_policy
  end

  def submission_success
     render :layout => 'success'
  end

end
