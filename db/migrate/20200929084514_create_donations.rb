class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.string :name
      t.string :email
      t.integer :amount
      t.string :stripe_token

      t.timestamps
    end
  end
end
