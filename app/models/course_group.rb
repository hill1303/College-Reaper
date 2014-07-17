# The +Course_Group+ class hold sets of courses that are evaluated together that relate to a users major. The model 
# provides a structure for grouping together courses that relate to one another. +Course_Group+ will help determine 
# what courses the user has to take, whether it be for the users major or minor.
#
# Attributes are stored as follows:
#
# 	*+:name+ holds the name of the Course_Group
# 	*+:college_global+ determines whether or not the Course_Group is versitile 
# 	*+:college_independent_flag+ reports whether or not a group does not apply to College_Global.
class Course_Group < ActiveRecord::Base

end