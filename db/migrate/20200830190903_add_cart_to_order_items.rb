class AddCartToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :cart_id, :integer
  end
end
