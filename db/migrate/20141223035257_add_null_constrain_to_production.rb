class AddNullConstrainToProduction < ActiveRecord::Migration
  def change
    change_column_null :products, :weight, false
  end
end
