require 'rails_helper'

describe College do
	it 'has a valid factory' 
		expect(build(:college)).to be_valid
	end

context 'has all attributes' do
	let (:college) {build(:college)}

		it 'has a :name attribute' do
			expect(@college_group.attributes).to include('name')
		end

	end

	context 'validates attributes correctly' do
		it 'validates the uniqueness of the :name attribute' do
			should validate_uniqueness_of(:name)
		end
	end
end