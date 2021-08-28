class AddStripePaymemtIdToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :stripe_payment_id, :string
  end
end
