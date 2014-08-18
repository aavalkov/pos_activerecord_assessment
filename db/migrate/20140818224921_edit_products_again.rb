class EditProductsAgain < ActiveRecord::Migration
  def change
  	remove_column :products, :price, :float
  	add_column :products, :price, :decimal
  end
end
