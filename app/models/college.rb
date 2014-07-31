# The College class represents the entity college in a university (eg. the College of Engineering, College of Arts and Sciences, etc.).
# One College has many Course_Groups.
#
# Attributes are stored as follows:
#
#   * +:name+ is stored as a string that represents the name of the college

class College < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  has_many :course_groups

  # Accessor for the associated CourseGroups of a College with the :college_global flag set using the cache to limit
  # database queries
  #
  # Returns:
  #
  #   * Cached array of CourseGroup associated with a given College instance where :college_global = true
  def cached_global_groups
    Rails.cache.fetch([self, course_groups]) { course_groups.where(college_global: true).to_a }
  end
end
