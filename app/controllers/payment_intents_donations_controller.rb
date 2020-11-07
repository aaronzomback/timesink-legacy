class PaymentIntentsDonationsController < ApplicationController

  def create

    # Create a payment intent with the expected amount,
    payment_intent = Stripe::PaymentIntent.create(
      amount: 6000,
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
end
