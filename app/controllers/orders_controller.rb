class OrdersController < ApplicationController
  before_filter :store_location
  before_action :authenticate_user!

  def new
    create_order
  end


  def create_order
    cart = Cart.find(params[:cart_id])
    @order = Order.create_from_cart(cart)
  end
end