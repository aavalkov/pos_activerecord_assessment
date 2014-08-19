require "spec_helper"

describe Login do	
	it 'validates the presence of a name' do
		login = Login.new(:name => "")
		login.save
		expect(login.save).to eq false
	end

	it {should have_and_belong_to_many :products}

	it 'converts login name to uppercase' do
		login = Login.create(:name => "aav")
		expect(login.name).to eq "AAV"
	end
end
