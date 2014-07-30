# The Completion class represents a course which a student has taken, while recording the grade received so that GPAs can be 
# calculated. A Completion class can have both many Users and Course associated to it.
#
# Attributs are stored as follows:
#
#   * +:grade+ is a 2-character text, with a default of 'W' to indicate the mark received by the associated user in
#     the associated course
class Completion < ActiveRecord::Base
  validates :grade, presence: true

  belongs_to :user
  belongs_to :course
end