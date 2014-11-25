class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def add_item(item)
    existing_item = cart_items.find {|ci| ci.product_id == item.product_id}
    if(existing_item)
      existing_item.quantity += item.quantity
    else
      cart_items << item
    end
  end

  def item_quantity
    cart_items.pluck(:quantity).reduce(:+) || 0
  end

  def total_price
    cart_items.sum(&:total_price).round(2)
  end
end
