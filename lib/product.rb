class Product <ActiveRecord::Base
	validates :name, :price, :presence => true
	has_and_belongs_to_many :logins

	def self.in_stock 
		where({:in_stock => true})
	end

end