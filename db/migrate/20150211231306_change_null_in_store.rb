class ChangeNullInStore < ActiveRecord::Migration
  def up
    change_column_null :stores, :exchange_rate, true
    change_column_default :stores, :exchange_rate, nil
  end

  def down
    change_column_null :stores, :exchange_rate, false
    change_column_default :stores, :exchange_rate, 6.0
  end
end
