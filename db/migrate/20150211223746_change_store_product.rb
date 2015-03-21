class ChangeStoreProduct < ActiveRecord::Migration
  def change
    remove_column :store_products, :price, :integer
  end
end
