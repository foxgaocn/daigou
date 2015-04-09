class AddVolumnToProduct < ActiveRecord::Migration
  def change
    add_column :products, :volumn, :string
  end
end
