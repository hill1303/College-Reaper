# The +Location+ class represents the location of a University building. 
# Coordinates are used to calculate distances between buildings to find 
# the most efficient route for a student.  
#
# +:name+ string that represents the building name
# +:latitude+ coordinate for North/South representation of location
# +:longitude+ coordinate for East/West representation of location
# +:street1, :street2, :city, :state, :zip+ are strings that represent 
# the physical address of a building
#
class Location < ActiveRecord::Base
end
