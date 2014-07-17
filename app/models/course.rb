# The +Course+ class provides information about an individual course. 
# Each course is related to a Course Group, College and Term. After 
# a user enters their preferences, courses will be evaluated and eliminated.
# Course information will also be displayed to the user once a schedule is
# determined.
#
# +:courseNo+ is the four digit course number for a specific course
# +:instrUnit+ represents the acronym that procedes a course number
# +:name+ provides a descriptive title for the course
# +:creditHrs+ provides the number of hours counted toward degree requirements
class Course < ActiveRecord::Base

end
