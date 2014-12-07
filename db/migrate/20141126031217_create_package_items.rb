class CreatePackageItems < ActiveRecord::Migration
  def change
    create_table :package_items do |t|
      t.references :package, index: true
      t.references :product, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
