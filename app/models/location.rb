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
  validates :name, presence: true, uniqueness: true
  validates :street1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  has_many :sections

  set_rgeo_factory_for_column(:latlong, RGeo::Geographic.spherical_factory(:srid => 4326))
end
