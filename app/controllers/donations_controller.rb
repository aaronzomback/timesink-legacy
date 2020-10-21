class DonationsController < ApplicationController

  def new
    @donation = Donation.new

  end

  def create
  @donation = Donation.new(form_params)


  @donation.save_and_charge


  Stripe::Charge.create(
    amount: (params[:amount]).to_i * 100,
    currency: "usd",
    source: @donation.stripe_token,
    description: "Donation for ",
    statement_descriptor: "TimeSink donation")

    redirect_to donation_success_path

end

  def form_params
    params.require(:donation).permit(:name, :email, :amount, :stripe_token)
  end

end
