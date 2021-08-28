class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :full_name
      t.string :email
      t.string :country
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :postal_code

      t.timestamps
    end
  end
end
