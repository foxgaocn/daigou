module ProductsHelper
  def setup_product(product)
    (5-product.pictures.count).times { product.pictures.build }
    product
  end
end
