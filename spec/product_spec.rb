require "spec_helper"

describe Product do
	it "vaidates the presence of a name" do
		product = Product.new({:name =>""})
		expect(product.save).to eq false
	end

end