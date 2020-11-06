class PaymentIntentsController < ApplicationController


#
  def create
    # create a payment intent with the expected amount

    payment_intent = Stripe::PaymentIntent.create(
      amount: 1000,
      currency: 'usd',
      description: 'order_for',
      statement_descriptor: 'TimeSink submission'


    )
    # return the client secret
    render json: {
      id: payment_intent_id,
      client_secret: payment_intent.client_secret
    }
  end

end
