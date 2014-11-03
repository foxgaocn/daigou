class CreateExchangeRate < ActiveRecord::Migration
  def change
    create_table :exchange_rates do |t|
      t.decimal :rate
      t.timestamps
    end
  end
end
