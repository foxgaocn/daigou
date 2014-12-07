class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :street
      t.string :post_code
      t.string :country
      t.string :phone_number
      t.references :user, index: true

      t.timestamps
    end
  end
end
