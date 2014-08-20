require 'bundler/setup'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
	puts "POS SYSTEM"
	puts "************************"
	loop do
		puts"Choose an option:"
		puts "1. Add"
		puts "2. List"
		puts "3. Make a sale"
		puts "4. Mark an item as 'out of stock'"
		puts "5. Edit"
		puts "6. Delete"
		puts "7. Exit"	
		case gets.chomp.to_i
		when 1 then add_menu
		when 2 then list_menu
		when 3 then sale
		when 4 then out_of_stock
		when 5 then edit_menu
		when 7 then exit	
		end
	end
end

def add_menu
	puts "Choose an option:"
	puts "1. Add a product"
	puts "2. Add login id"
	case gets.chomp.to_i
	when 1 then add_product
	when 2 then add_login
	end
end

def list_menu
	puts "Choose an option:"
	puts "1. List products"
	puts "2. List all login names"
	puts "3. View all items that one employee has sold"
	puts "4. View all employees that have sold a single item"
	puts "5. View all in stock items"
	case gets.chomp.to_i
	when 1 then list_products
	when 2 then list_login
	when 3 then list_items_by_employee
	when 4 then list_employee_by_item
	when 5 then list_in_stock
	end
end

def edit_menu
	puts 'Choose an option:'
	puts "1. Edit Products"
	puts "2. Edit logins"
	case gets.chomp.to_i
	when 1 then edit_product
	when 2 then edit_login
	end
end

def sale
	puts "Enter your number to log in:"
	list_login
	current_login = Login.all[(gets.chomp.to_i) - 1]
	loop do
		puts "Enter the number of the item being sold"
		list_products
		current_item = Product.all[(gets.chomp.to_i) -1]
		current_login.products << current_item
		puts current_item.name + " added!"
		puts "Press 1 to add another item"
		puts "Press 2 to return to the main menu"
		case gets.chomp.to_i
		when 2 then
			main_menu
		end
	end
end

def add_product
	puts "Enter the name of the product:"
	name = gets.chomp
	puts "Enter the price of the product:"
	price = gets.chomp
	new_product = Product.new({:name => name, :price => price, :in_stock => true})
	new_product.save
	if new_product.save
		puts new_product.name + " has been added to the system"
	else
		puts "Invalid Entry"
		product.errors.full_messages.each { |message| puts message }
	end
end

def add_login
	puts "Enter your login id name"
	new_login = Login.new({:name => gets.chomp})
	new_login.save
	if new_login.save
		puts new_login.name + " has been added as a login id."
	else
		puts "Invalid Login"
		login.errors.full_messages.each { |message| puts message }
	end
end

def list_products
	puts "All Products:"
	products = Product.all.each_with_index do |product, index|
		puts (index+1).to_s + ". " + product.name + " $" + product.price.to_s
	end
end

def list_login
	puts "All Login Id's"
	logins = Login.all.each_with_index do |login, index|
		puts (index +1).to_s + ". " + login.name
	end
end

def list_items_by_employee
	puts "Enter the number of the employee:"
	list_login
	current_login = Login.all[(gets.chomp.to_i) - 1]
	puts current_login.name + " has sold:"
	current_login.products.each_with_index do |item, index|
		puts (index +1).to_s + ". " + item.name
	end
end

def list_employee_by_item
	puts "Enter the number of the product:"
	list_products
	current_product = Product.all[(gets.chomp.to_i)-1]
	current_product.logins.uniq.each_with_index do |login, index|
		puts (index +1).to_s + ". " + login.name
	end
end

def list_in_stock
	puts "All in stock items:"
	products = Product.in_stock.each_with_index do |product, index|
		puts (index +1).to_s + ". " + product.name
	end
end

def out_of_stock
	puts "Enter the number of the product"
	list_products
	choice = Product.all[(gets.chomp.to_i)-1]
	product = Product.find_by(:id => choice.id)
	product.update(:in_stock => false)
end

def edit_product
	puts "Enter the number of the product"
	list_products
	choice = Product.all[(gets.chomp.to_i)-1]
	puts "Enter a choice"
	puts "1. Edit name"
	puts "2. Edit price"
	case gets.chomp.to_i
	when 1
		product = Product.find_by(:id => choice.id)
		puts "Enter the new name"
		product.update(:name => gets.chomp)
	when 2
		product = Product.find_by(:id => choice.id)
		puts "Enter the new price"
		product.update(:price => gets.chomp)
	end
end


main_menu