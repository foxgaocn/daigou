class Packing
  MAX_PACK = 4500

  def pack_order(order)
    @order = order
    @order.order_items.sort{|a,b| b.product.weight <=> a.product.weight}.each do |item|
      item.quantity.times { pack_unit_item(item) }
    end
  end

  private

  def pack_unit_item(item)
    raise 'cannot pack item greater than 4500 gram' if (item.product.weight > 4500)

    return if try_add(item)
    package = @order.packages.create
    package.package_items.create(product_id: item.product_id, quantity: 1)
  end

  def try_add(item)
    @order.packages.detect {|package| package.try_add(item)}
  end
end