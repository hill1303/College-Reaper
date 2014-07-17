FactoryGirl.define  do
	factory :section do
		room '104'
		start_time '11:00'
		end_time '11:00'
		rpt_pattern 'MWF'
		open_flag 'F'
		course_seats '30'
		wait_seats '10'
		seat_max '40'
		wait_max '999'
		
	end
end