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
end