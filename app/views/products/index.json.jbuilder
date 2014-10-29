json.array!(@products) do |product|
  json.extract! product, :id, :sku, :name, :desc, :category_id, :price, :stock, :active, :weight
  json.url product_url(product, format: :json)
end
