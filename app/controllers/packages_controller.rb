class PackagesController < ApplicationController
  #before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  respond_to :json

  def batch_update
    binding.pry
    @order = Order.find(params[:order_id])
    packages_params[:packages].each do |package|
      @order.packages.find(package[:package_id]).update_attribute(:address_id, package[:address_id])
    end
    render nothing: true, status: 204
  end

  private
  def packages_params
    params.permit(:packages => [:package_id, :address_id])
  end
end