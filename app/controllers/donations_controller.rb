class DonationsController < ApplicationController


  def index
    render "new"
  end


  def new
    @donation = Donation.new

  end

  def create
  @donation = Donation.new(form_params)


   if @donation.save

  DonationMailer.newdonation(@donation).deliver_now

    redirect_to donation_success_path

  else

    render "new"

  end
end

  def form_params
    params.require(:donation).permit(:name, :email, :amount, :stripe_payment_id, :amount_in_dollars)
  end

end
