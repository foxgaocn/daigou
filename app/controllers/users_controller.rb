class UsersController < ApplicationController
  before_action :authenticate_user!

  def dash_board
  end

  def orders
    @orders = current_user.orders
  end

  def addresses
    @addresses = current_user.addresses
  end

  def products
    store = current_user.store
    @products = StoreProduct.includes(:product).where(store_id: store.id)
  end

  def update_products
    @invalid_products = StoreProduct.update(params[:products].keys, params[:products].values).reject { |p| p.errors.empty? }
    if @products.empty?
      flash[:notice] = "Products updated"
      redirect_to products_url
    else
      render :action => "edit_individual"
    end
  end
end