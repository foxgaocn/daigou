class AddRmbpriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :rmbprice, :integer
  end
end
