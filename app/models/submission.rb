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

      Stripe.api_key = Rails.application.credentials[Rails.env.to_sym][:stripe_secret_key]

      Stripe::Charge.create(
        amount: 1000,
        currency: "usd",
        source: self.stripe_token,
        description: "Order for ",
        statement_descriptor: "TimeSink submit")

      self.save

    else
      # doesn't pass validations
      false
    end

  rescue Stripe::CardError => e
    # this is from stripe
    @message = e.json_body[:error][:message]

    # then add to the model errors
    self.errors.add(:stripe_token, @message)

    # return false to our controller
    false
  end

  end
