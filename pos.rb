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
		puts "3. Exit"	
		case gets.chomp.to_i
		when 1 then add_meu
		when 2 then list_menu
		when 3 then Exit	
		end
	end
end

def add_menu
	puts "Choose an option:"
	puts "1. Add a product"
	case gets.chomp.to_i
	when 1 then add_product
	end
	
end

def add_product
	end

main_menu