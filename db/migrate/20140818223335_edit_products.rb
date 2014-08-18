class EditProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :price, :integer
  	add_column :products, :price, :float
  end
end
