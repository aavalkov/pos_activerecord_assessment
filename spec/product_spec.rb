require "spec_helper"

describe Product do
	it "vaidates the presence of a name" do
		product = Product.new({:name =>""})
		expect(product.save).to eq false
	end

	it "vaidates the presence of a name and price" do
		product = Product.new({:name =>"Wine", :price => 10.00})
		expect(product.save).to eq true
	end

	it {should have_and_belong_to_many :logins}

	it 'returns items that are in stock' do
		in_stock = (1..3).to_a.map { |number| Product.create(:name => "product #{number}", :price => 5.00, :in_stock => true)}
		product4 = Product.new({:name => "Grapes", :price => 3.99, :in_stock => false})
		expect(Product.in_stock).to eq in_stock
	end
end