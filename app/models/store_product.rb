class StoreProduct < ActiveRecord::Base
  validates :product_id, :store_id, presence: true

  #after_create :auto_price

  belongs_to :store
  belongs_to :product

  def rate
    store.exchange_rate || Rails.cache.read('exchange_rate').to_f
  end

  def auto_price
    self.product.price * rate * (100 + self.store.price_factor)/100
  end

  def auto_price_in_yuan
    '%.2f' % (auto_price/100.0)
  end

  def display_price_in_yuan
    '%.2f' % ((custom_price || auto_price)/100.0)
  end
end
