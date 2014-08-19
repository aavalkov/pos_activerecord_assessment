class AlterSalesTable < ActiveRecord::Migration
  def change
  	rename_table :sales, :logins_products
  end
end
