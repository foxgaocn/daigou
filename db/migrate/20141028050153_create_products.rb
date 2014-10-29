class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.text :desc
      t.references :category, index: true
      t.decimal :price
      t.integer :stock
      t.boolean :active
      t.integer :weight

      t.timestamps
    end
  end
end
