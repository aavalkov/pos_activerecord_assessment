class Product <ActiveRecord::Base
	validates :name, :price, :presence => true
	has_and_belongs_to_many :logins
end