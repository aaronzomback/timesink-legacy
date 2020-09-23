class Order < ApplicationRecord


  has_many :order_items


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :country, presence: true


  accepts_nested_attributes_for :order_items

  def add_from_cart(cart)
  cart.order_items.all.each do |item|
    self.order_items.build(product_variant: item.product_variant, quantity: item.quantity)
  end
end



  def total_price
   @total = 0

   order_items.each do |item|
     @total = @total + item.product_variant.price_in_dollars * item.quantity
   end

   @total
 end


 def total_price_in_dollars
   @total = 0

   order_items.all.each do |item|
     @total = @total + item.product_variant.price_in_dollars * item.quantity
   end

   @total
 end

end
