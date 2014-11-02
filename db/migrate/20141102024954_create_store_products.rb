class CreateStoreProducts < ActiveRecord::Migration
  def change
    create_table :store_products do |t|
      t.references :store, index: true
      t.references :product, index: true
      t.integer :price
      t.integer :custom_price
      t.timestamps
    end
  end
end
