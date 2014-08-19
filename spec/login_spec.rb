require "spec_helper"

describe Login do	
	it 'validates the presence of a name' do
		login = Login.new(:name => "")
		login.save
		expect(login.save).to eq false
	end

	it {should have_and_belong_to_many :products}
end
