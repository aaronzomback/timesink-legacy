class AddStripeTokenToSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions, :stripe_token, :string
  end
end
