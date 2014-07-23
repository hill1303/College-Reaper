# The RequirementGroup class represents a set of Courses and associates a completion rule to that Course set. This
# allows for a representation of prerequisites for Courses or for CourseGroup completion checks (ie. did the user take 
# all Courses in a major or minor, satisfy a general curriculum requirement, etc.)
# 
# Attributes are stored as follows:
#   * +:name+ holds the name of the RequirementGroup
#   * +:rule+ the completion rule that is associated with a stored procedure for validating a user's completion of requirements
class RequirementGroup < ActiveRecord::Base
  validates :name, presence: true
  validates :rule, presence: true

  belongs_to :course_group
  belongs_to :course
  has_and_belongs_to_many :courses
end
