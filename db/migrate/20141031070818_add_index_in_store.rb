class AddIndexInStore < ActiveRecord::Migration
  def change
    add_index :stores, :name
  end
end
