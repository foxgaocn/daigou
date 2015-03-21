class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def add_item(item)
    existing_item = cart_items.find {|ci| ci.product_id == item.product_id}
    if(existing_item)
      existing_item.update_attribute(:quantity, existing_item.quantity + item.quantity)
    else
      cart_items << item
    end

  end

  def update(items)
    if(cart_items.count == items.count)
      items.each do |item|
        need_update = cart_items.find{|i| i.product_id == item["product_id"] && i.quantity != item["quantity"]}
        need_update.update_attribute(:quantity, item["quantity"]) if need_update
      end
    else
      cart_items.delete_all
      items.each do |item|
        cart_items.create(item)
      end
    end
  end

  def item_quantity
    cart_items.pluck(:quantity).reduce(:+) || 0
  end

  def total_price
    cart_items.reduce(0){|sum, i| sum + i.total_price}.round(2)
  end
end
