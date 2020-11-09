class PaymentIntentsDonationsController < ApplicationController

  def create





    # Create a payment intent with the expected amount,
    payment_intent = Stripe::PaymentIntent.create(
      amount: (params[:amount]).to_i * 100,
      currency: 'usd',
      description: "Donation to TimeSink ",
      statement_descriptor: 'TimeSink donation'
    )
    # return the client secret
    render json: {
      id: payment_intent.id,
      client_secret: payment_intent.client_secret
    }


  end

  def f_params
    params.permit(:name, :email, :amount, :stripe_payment_id, :authenticity_token)
  end

end
