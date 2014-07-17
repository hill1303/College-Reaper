# The +Section+ class represents a single section of a course that is offered by the College during a term.

# Section Attributes are stored as follows: 

# * +:room+ is stored as an integer represents the room number
# * +:start_time+ is stored as time and represents the start time of the section for that section 
# * +:end_time+ is stored as time and represents the start time of the section for that section 
# * +:rpt_pattern+ is stored as string and represents the what days per week the section meets
# * +:open_flag+ is stored as a boolean and represents whether the section is open or close
# * +:course_seats+ is stored as an integer and represents the number of students enrolled in the course
# * +:wait_seats+ is stored as an integer and represents the number of students that are in the wait list
# * +:seat_max+ is stored as an integer and represents the maximum seat capacity of a section
# * +:wait_max+ is stored as an integer and represents the maximum seat capacity of the waitlist for the section

class Section < ActiveRecord::Base

end
