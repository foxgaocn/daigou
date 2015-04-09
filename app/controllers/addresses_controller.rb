class AddressesController < ApplicationController
  before_action :authenticate_user!

  respond_to :json

  def create
    @address = Address.create(address_params.merge(user_id: current_user.id))
    respond_with @address
  end

  def index
  end

  private
  def address_params
    params.require(:address).permit(:name, :street, :post_code, :phone_number, :sid)
  end
end