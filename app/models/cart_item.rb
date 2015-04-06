class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price 
    (product.rmb_price * quantity).round(2)
  end
end
