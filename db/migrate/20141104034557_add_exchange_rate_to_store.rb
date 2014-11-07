class AddExchangeRateToStore < ActiveRecord::Migration
  def change
    add_column :stores, :exchange_rate, :decimal, null: false, default: 6.0
  end
end
