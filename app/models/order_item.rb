class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def total_price 
    (product.dollar_price * quantity).round(2)
  end
end
