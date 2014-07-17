describe Location do
	it 'has a valid factory' do
		expect(build(:location)).to be_valid
	end

# Test presence of attributes
	it 'has a :name attribute' do
		expect(@course.attributes).to include('name')
	end

	it 'has a :latitude attribute' do
		expect(@course.attributes).to include('latitude')
	end

	it 'has a :longitude attribute' do
		expect(@course.attributes).to include('longitude')
	end

	it 'has a :street1 attribute' do
			expect(@course.attributes).to include('street1')
		end

	it 'has a :street2 attribute' do
			expect(@course.attributes).to include('street2')
		end

	it 'has a :city attribute' do
			expect(@course.attributes).to include('city')
		end

	it 'has a :state attribute' do
		expect(@course.attributes).to include('state')
	end

	it 'has a :zip attribute' do
		expect(@course.attributes).to include('zip')
	end
end