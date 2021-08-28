class AddPaymentIdToSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions, :stripe_payment_id, :string
  end
end
