class Submission < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :year, presence: true
  validates :description, presence: true
  validates :film_link, presence: true

  def save_and_charge
    # check if data is valid
    #if is, charge in stripe and save if all valid
    #if it isn't, return false

    if self.valid?

      require 'stripe'

  Stripe.api_key = Rails.application.credentials[Rails.env.to_sym][:stripe_secret_key]



  post '/create-payment-intent' do
    data = JSON.parse(request.body.read)

    payment_intent = Stripe::PaymentIntent.create(
      amount: 1400,
      currency: 'usd',
      source: self.payment_intent.client_secret
    )
    {
      client_secret: payment_intent.client_secret
    }.to_json
  end

  post '/webhook' do
    # You can use webhooks to receive information about asynchronous payment events.
    # For more about our webhook events check out https://stripe.com/docs/webhooks.
    webhook_secret = ENV['STRIPE_WEBHOOK_SECRET']
    payload = request.body.read
    if !webhook_secret.empty?
      # Retrieve the event by verifying the signature using the raw body and secret if webhook signing is configured.
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      event = nil

      begin
        event = Stripe::Webhook.construct_event(
          payload, sig_header, webhook_secret
        )
      rescue JSON::ParserError => e
        # Invalid payload
        status 400
        return
      rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        puts "⚠️  Webhook signature verification failed."
        status 400
        return
      end
    else
      data = JSON.parse(payload, symbolize_names: true)
      event = Stripe::Event.construct_from(data)
    end
    # Get the type of webhook event sent - used to check the status of PaymentIntents.
    event_type = event['type']
    data = event['data']
    data_object = data['object']

    if event_type == 'some.event'
      puts "🔔  Webhook received!"
    end

    content_type 'application/json'
    {
      status: 'success'
    }.to_json
  end

      self.save

    else
      # doesn't pass validations
      false
    end

end

  end
