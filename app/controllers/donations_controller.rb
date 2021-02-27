class DonationsController < ApplicationController


  def index
    render "new"
  end


  def new
    @donation = Donation.new

      # render :layout => 'success'

  end

  def create
  @donation = Donation.new(form_params)


   if @donation.save

  DonationMailer.newdonation(@donation).deliver_now
  DonationMailer.ThankYou(@donation).deliver_now

    redirect_to donation_success_path

  else

    render "new"

  end
end

  def form_params
    params.require(:donation).permit(:name, :email, :note, :amount, :stripe_payment_id, :amount_in_dollars)
  end

end
