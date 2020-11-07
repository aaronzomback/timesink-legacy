class Donation < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true


  def amount_in_dollars
    :amount * 100
  end

  DONATION_DOLLAR_AMOUNTS = [10, 25, 50, 100]
  attr_accessor :amount

  # Use dollar amount in param or 5 if none, then convert to cents


end
