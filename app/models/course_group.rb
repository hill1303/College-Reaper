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
  validates :name, presence: true, uniqueness: true

  belongs_to :college
  has_and_belongs_to_many :users
  has_and_belongs_to_many :courses

  has_many :completion_rules, class_name: 'RequirementGroup', as: :owner

  # Accessor for the associated courses of a CourseGroup using the cache to limit database queries
  #
  # Returns:
  #
  #   * Cached array of Course associated with a given CourseGroup instance
  def cached_courses
    Rails.cache.fetch([self, courses]) { courses.to_a }
  end

  # Accessor for the associated College of a CourseGroup using the cache to limit database queries
  #
  # Returns:
  #
  #   * Cached College associated with a given CourseGroup instance
  def cached_college
    Rails.cache.fetch([self, college]) { college }
  end
end