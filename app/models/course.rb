# The Course class provides information about an individual course. Each course is related to one or more CourseGroup,
# Section and Term.
#
# Attributes are stored as follows:
#
#   * +:course_number+ is the four digit course number for a specific course
#   * +:instructional_unit+ represents the acronym that precedes a course number
#   * +:name+ provides a descriptive title for the course
#   * +:credit_hours+ provides the number of credit hours counted toward degree
class Course < ActiveRecord::Base
  validates :course_number, presence: true, numericality: true
  validates :instructional_unit, presence: true
  validates :name, presence: true
  validates :credit_hours, presence: true, numericality: { only_integer: true }

  has_many :sections
  has_many :pre_requisites, class_name: 'RequirementGroup', as: :owner
  has_and_belongs_to_many :terms
end
