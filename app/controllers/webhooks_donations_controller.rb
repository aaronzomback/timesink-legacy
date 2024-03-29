class WebhooksDonationsController < ApplicationController


  skip_before_action :verify_authenticity_token


def create
  payload = request.body.read
  sig_header = request.env['HTTP_STRIPE_SIGNATURE']
  event = nil
  endpoint_secret = Rails.application.credentials[Rails.env.to_sym][:stripe_webhook_secret_donations]


  begin
    event = Stripe::Webhook.construct_event(
      payload, sig_header, endpoint_secret
    )
  rescue JSON::ParserError => e
    # Invalid payload
    render json: { message: 'invalid json' }, status: 400
    return
  rescue Stripe::SignatureVerificationError => e
    # Invalid signature
    render json: { message: 'signature verification failed' }, status: 400
    return
  end

  # Handle the event
  case event.type
  when 'payment_intent.succeeded'
    payment_intent = event.data.object # contains a Stripe::PaymentIntent

    puts "PaymentIntent succeeded"
    @donation = Donation.find_by!(stripe_payment_id: payment_intent.id)
    puts "Donation found: #{@donation.amount}"

    DonationMailer.ThankYou(@donation).deliver_now
    # DonationMailer.newdonation(@donation).deliver_now

  else
    puts "Unhandled event type: #{event.type}"
  end

  render json: { message: 'success' }
end
end
