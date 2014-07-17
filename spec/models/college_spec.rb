describe College do
	it 'has a valid factory'
		expect(build(:college)).to be_valid
	end

describe 'attributes' do
	before(:each) do
		@college= build(:college)
end

		it 'has a :name attribute' do
			expect(@college_group.attributes).to include('name')
		end

	end
end