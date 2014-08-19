class Login <ActiveRecord::Base
	validates :name, :presence => true
	has_and_belongs_to_many :products
	before_save :upcase_name
		private

	def upcase_name
		self.name = self.name.upcase
	end
end