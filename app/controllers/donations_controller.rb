class DonationsController < ApplicationController

  def new
    @donation = Donation.new

  end

  def create
  @donation = Donation.new(form_params)


   if @donation.save

    redirect_to donation_success_path

  else

    render "new"

  end
end

  def form_params
    params.require(:donation).permit(:name, :email, :amount, :stripe_payment_id)
  end

end
