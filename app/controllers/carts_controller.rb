class CartsController < ApplicationController

  before_action :load_cart, only: [:show, :add_item]
  
  def show
  end

  def add_item
    @cart.add_item(CartItem.new(item_params))
    respond_to do |format|
      format.html
      format.json
    end
  end

  def item_quantity
    if (session[:cart_id].present? || user_signed_in?)
      load_cart
      render json: { quantity: @cart.item_quantity}
    else
      render json: {quantity: 0}
    end
  end

  private
  def item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

  def load_cart
    if user_signed_in?
      @cart ||= Cart.find_or_create_by(user_id: current_user.id)
    else
      @cart ||= Cart.find_by_id(session[:cart_id]) || Cart.create
    end
    session[:cart_id] = @cart.id
    @cart
  end
end
