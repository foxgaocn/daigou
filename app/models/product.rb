class Product < ActiveRecord::Base
  belongs_to :category

  has_many :pictures, dependent: :destroy

  has_many :store_products, dependent: :delete_all
  has_many :store, through: :store_products

  accepts_nested_attributes_for :pictures, :reject_if => proc {|attributes|
    attributes.all? {|k,v| v.blank?}
  }, :allow_destroy => true

  validates :price, presence: true, numericality: { only_integer: true }
  validates :weight, presence: true, numericality: { only_integer: true }
  validates :name, presence: true

  after_create :add_to_store
  after_destroy :remove_from_store


  self.per_page = 12

  def dollar_price
    price.nil? ? 0: price/100.00.round(2)
  end

  def rmb_price
    rmbprice.nil? ? 0: rmbprice/100.00.round(2)
  end

  def add_to_store
    Store.includes(:products).each { |s| s.products << self }
  end

  def remove_from_store
    Store.includes(:products).each { |s| s.products.reject! {|p| p.id == id}}
  end
end
