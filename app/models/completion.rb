# The Completion class represents a course which a student has taken, relating a User and Course while recording the
# grade received so that GPAs can be calculated.
#
# Attributs are stored as follows:
#
#   * +:grade+ is a 1-character string, with a default of 'W' to indicate the mark received by the associated user in
#     the associated course
class Completion < ActiveRecord::Base
  validates :grade, presence: true, length: { is: 1 }

  belongs_to :user
  belongs_to :course
end