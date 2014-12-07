class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.references :order, index: true
      t.references :address, index: true
      t.string :track_number

      t.timestamps
    end
  end
end
