require 'dragonfly'
class Store < ActiveRecord::Base
  dragonfly_accessor :qr_code

  belongs_to :user
end
