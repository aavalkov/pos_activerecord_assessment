class CreateTables < ActiveRecord::Migration
  def change
    create_table :logins do |t|
    	t.string :name
    end
    create_table :products do |t|
    	t.string :name
    	t.integer :price
    end
    create_table :sales do |t|
    	t.belongs_to :login
    	t.belongs_to :product
    end
  end
end
