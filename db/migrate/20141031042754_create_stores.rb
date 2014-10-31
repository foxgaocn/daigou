class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.references :user
      t.string :qr_code
      t.string :name
      t.timestamps
    end
  end
end
