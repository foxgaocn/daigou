class ProductsController < ApplicationController
  before_action :set_store, only: [:update]


   private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:sku, :name, :desc, :category_id, :price, :stock, :active, :weight,
       :pictures_attributes=>[:_destroy, :id, :image])
    end

end