describe Person do
	it 'has a valid factory' do
		expect(build(:person)).to be_valid
	end

	describe 'attributes' do 
		before(:each) do
			@person = build(:person)
		end

		it 'has :name attribute' do 
			expect(@person.attributes).to include('name')
		end
		it 'has :dob attribute' do 
			expect(@person.attributes).to include('dob')
		end
		it 'has :sex attribute' do 
			expect(@person.attributes).to include('sex')
		end
		it 'has :gender attribute' do 
			expect(@person.attributes).to include('gender')
		end
		it 'has :pronoun attribute' do 
			expect(@person.attributes).to include('pronoun')
		end
		it 'has :title attribute' do 
			expect(@person.attributes).to include('title')
		end
		it 'has :suffix attribute' do 
			expect(@person.attributes).to include('suffix')
		end
	end	
end