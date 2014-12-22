class OrdersController < ApplicationController
  before_filter :store_location
  before_action :authenticate_user!

  def new
    create_order
    redirect_to action: :show, id: @order.id
  end

  def show
    find_order
    if @order.status == Order::CREATED
      render 'show'
    else
      render 'confirmed'
    end
  end

  def confirm
    find_order
    @order.confirm
    render nothing: true, status: 204
  end

  def confirmed
  end

  def detail
    find_order
    render :layout => "users"
  end

  private
  def create_order
    cart = Cart.find(params[:cart_id])
    @order = Order.create_from_cart(cart)
  end

  def find_order
    @order ||= current_user.orders.find(params[:id])
  end
end