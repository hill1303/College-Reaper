# The College class represents the entity college in a university (eg. the College of Engineering, College of Arts and Sciences, etc.).
# One College has many Course_Groups.
#
# Attributes are stored as follows:
#
#   * +:name+ is stored as a string that represents the name of the college

class College < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  has_many :course_groups
end
