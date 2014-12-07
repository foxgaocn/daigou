class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :packages

  validates :user_id, presence: true

  def self.create_from_cart(cart)
    order = Order.create(user_id: cart.user_id, status: 0)
    cart.cart_items.each do |cart_item|
      order.order_items.create(product_id: cart_item.product_id, quantity: cart_item.quantity)
    end

    create_packages(order)
    order
  end

  def total_price
    order_items.sum(&:total_price).round(2)
  end

  def total_deliver_cost
    packages.sum(&:deliver_cost)
  end

  #price + total_deliver_cost
  def cost
    total_price + total_deliver_cost
  end

  private
  def self.create_packages(order)
    Packing.new.pack_order order
  end

end
