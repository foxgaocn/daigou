class StoreProduct < ActiveRecord::Base
  validates :product_id, :store_id, presence: true

  after_create :auto_price

  belongs_to :store
  belongs_to :product

  def auto_price
    price = self.product.price * (100 + self.store.price_factor)/100
    update_attribute(:price, price)
  end
end
