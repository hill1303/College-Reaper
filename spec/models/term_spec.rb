describe Term do
	it 'has a valid factory'
		expect(build(:term)).to be_valid
	end
end

describe 'attributes' do
	before(:each) do
		@term= build(:term)
end

		it 'has a :name attribute' do
			expect(@college_group.attributes).to include('name')
		end

		it 'has a :start_date attribute' do
			expect(@college_group.attributes).to include('start_date')
		end

		it 'has a :end_time attribute' do
			expect(@college_group.attributes).to include('end_time')
		end


	end
end