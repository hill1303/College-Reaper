require 'rails_helper'

describe Term do
	it 'has a valid factory'
		expect(build(:term)).to be_valid
	end


context 'has all attributes' do
	let (:term) {build(:term)}

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