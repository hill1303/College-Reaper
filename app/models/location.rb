# The Location class represents the location of a building, storing both its street address and a spatial
# representation of its GPS coordinates
#
# Attributes are stored as follows:
#   * +:name+ string that represents the building name
#   * +:latitude+ coordinate for North/South representation of location
#   * +:longitude+ coordinate for East/West representation of location
#   * +:street1+ string that stores primary street address
#   * +:street2+ string for optional entry
#   * +:city+ string to store city from address
#   * +:state+ string to hold state from address
#   * +:zip+ zip code of address stored as string
class Location < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :street1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  has_many :sections

  set_rgeo_factory_for_column(:latlong, RGeo::Geographic.spherical_factory(:srid => 4326))
end
