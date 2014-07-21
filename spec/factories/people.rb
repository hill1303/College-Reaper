FactoryGirl.define do 
	factory :person do
		name 'Dan Carlozzi'
		dob Date.new(1993, 5, 13)
		sex 'M'
		gender 'Male'
		pronoun 'His'
		title 'Mr.'
		suffix nil	 
	end
end