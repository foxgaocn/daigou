class StoresController < ApplicationController
  before_action :ensure_mystore!
  before_action :set_store
  
  # GET /store/1/edit
  def edit

  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:sku, :name, :desc, :category_id, :price, :stock, :active, :weight,
        :pictures_attributes=>[:_destroy, :id, :image])
    end

    def ensure_mystore!
      return unless current_user.present? && current_user.store.id == params[:id] 
      #todo show error message
      redirect_to products_url
    end


end