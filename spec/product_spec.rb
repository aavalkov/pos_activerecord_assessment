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

end