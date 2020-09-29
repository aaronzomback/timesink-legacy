class Donation < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true


  def amount_in_dollars
    :amount * 100
  end

  DONATION_DOLLAR_AMOUNTS = [10, 25, 50, 100]
  attr_accessor :amount



  # Use dollar amount in param or 5 if none, then convert to cents

  def save_and_charge
    # check if data is valid
    #if is, charge in stripe and save if all valid
    #if it isn't, return false

    if self.valid?

      Stripe.api_key = Rails.application.credentials[Rails.env.to_sym][:stripe_secret_key]


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
