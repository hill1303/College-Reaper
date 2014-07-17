describe Section do
	it 'has a valid factory'
		expect(build(:section)).to be_valid
	end
end

describe 'attributes' do
	before(:each) do
		@section= build(:section)
end


		it 'has a :room attribute' do
			expect(@college_group.attributes).to include('room')
		end


		it 'has a :start_time attribute' do
			expect(@college_group.attributes).to include('start_time')
		end


		it 'has a :end_time attribute' do
			expect(@college_group.attributes).to include('end_time')
		end


		it 'has a :rpt_pattern attribute' do
			expect(@college_group.attributes).to include('rpt_pattern')
		end


		it 'has a :open_flag attribute' do
			expect(@college_group.attributes).to include('open_flag')
		end


		it 'has a :course_seats attribute' do
			expect(@college_group.attributes).to include('course_seats')
		end


		it 'has a :wait_seats attribute' do
			expect(@college_group.attributes).to include('wait_seats')
		end


		it 'has a :seat_max attribute' do
			expect(@college_group.attributes).to include('seat_max')
		end


		it 'has a :wait_max attribute' do
			expect(@college_group.attributes).to include('wait_max')
		end

	end
end