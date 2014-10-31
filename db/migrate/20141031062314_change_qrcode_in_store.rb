class ChangeQrcodeInStore < ActiveRecord::Migration
  def change
    add_column :stores, :qr_code_uid,  :string
    add_column :stores, :show_price, :boolean, :default => true
    add_column :stores, :price_factor, :integer, :default => 10
    remove_column :stores, :qr_code
  end
end
