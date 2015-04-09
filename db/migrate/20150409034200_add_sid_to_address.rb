class AddSidToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :sid, :string
  end
end
