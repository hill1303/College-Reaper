# The CourseGroup class holds a set of courses that are evaluated together and relate to a users major. The model
# provides a structure for grouping together Courses that relate to one another. CourseGroup will help determine
# what courses the user has to take, and loosely represents a major or minor.
#
# Attributes are stored as follows:
#
#   * +:name+ holds the name of the CourseGroup
#   * +:college_global+ determines whether or not the CourseGroup is versatile
#   * +:college_independent+ reports whether or not a group does not apply to College_Global.
class CourseGroup < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :college
  has_many :requirement_groups

end