describe Course_Group do
	it 'has a valid factory' do
		expect(build(:course_group)).to be_valid
	end

	describe 'attributes' do 
		before(:each) do
			@course_group = build(:course_group)
		end

		it 'has :name attribute' do 
			expect(@course_group.attributes).to include('name')
		end
		it 'has :course_global_flag attribute' do 
			expect(@course_group.attributes).to include('course_global_flag')
		end
		it 'has :course_independent_flag attribute' do 
			expect(@course_group.attributes).to include('course_independent_flag')
		end
	end	
end