require 'dragonfly'
class Store < ActiveRecord::Base
  dragonfly_accessor :qr_code

  belongs_to :user, dependent: :destroy

  has_many :store_products, dependent: :delete_all
  has_many :products, through: :store_products

end
