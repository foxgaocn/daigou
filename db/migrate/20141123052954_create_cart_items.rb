class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :product, index: true
      t.integer :quantity
      t.references :cart, index: true

      t.timestamps
    end
  end
end
