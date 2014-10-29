class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :product, index: true
      t.attachment :image
      t.timestamps
    end
  end
end
