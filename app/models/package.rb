class Package < ActiveRecord::Base
  belongs_to :order
  belongs_to :address
  has_many :package_items

  PACKAGE_WEIGHT = 500

  def try_add(item)
    if total_weight_net + item.product.weight <  Packing::MAX_PACK
      existing_item = package_items.find{ |i| i.product_id == item.product_id}
      if(existing_item)
        existing_item.update_attribute(:quantity, existing_item.quantity + 1)
      else
        package_items.create(product_id: item.product_id, quantity: 1)
      end
      true
    end   
  end

  def total_weight_net
    package_items.reduce(0) {|sum, item| sum += item.product.weight * item.quantity }
  end

  def total_weight
    ((total_weight_net + PACKAGE_WEIGHT) / 1000.0).round(2)
  end

  def deliver_cost
    0
    #(total_weight * 2).ceil/2.0 * 10
  end
end
