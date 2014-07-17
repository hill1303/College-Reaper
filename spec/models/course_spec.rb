describe Course do
	it 'has a valid factory' do
		expect(build(:course)).to be_valid
	end

	describe 'attributes' do
		before(:each) do
			@course = build(:course)
		end

		it 'has a :instrUnit attribute' do
			expect(@course.attributes).to include('instrUnit')
		end

		it 'has a :courseNo attribute' do
			expect(@course.attributes).to include('courseNo')
		end

		it 'has a :name attribute' do
			expect(@course.attributes).to include('name')
		end

		it 'has a :creditHrs attribute' do
			expect(@course.attributes).to include('creditHrs')
		end
end