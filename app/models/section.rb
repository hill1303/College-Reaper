# The Section class represents a single section of a course that is offered by the College during a term.
#
# Attributes are stored as follows:
#
#   * +:room+ is stored as an integer represents the room number
#   * +:start_time+ is stored as time and represents the start time of the section for that section 
#   * +:end_time+ is stored as time and represents the start time of the section for that section 
#   * +:rpt_pattern+ is stored as string and represents the what days per week the section meets
#   * +:open_flag+ is stored as a boolean and represents whether the section is open or close
#   * +:course_seats+ is stored as an integer and represents the number of students enrolled in the course
#   * +:wait_seats+ is stored as an integer and represents the number of students that are in the wait list
#   * +:seat_max+ is stored as an integer and represents the maximum seat capacity of a section
#   * +:wait_max+ is stored as an integer and represents the maximum seat capacity of the waitlist for the section

class Section < ActiveRecord::Base
  validates :room, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :rpt_pattern, presence: true

  validates :course_seats, presence: true, numericality: true
  validates :wait_seats, presence: true, numericality: true
  validates :seat_max, presence: true, numericality: true
  validates :wait_max, presence: true, numericality: true

  belongs_to :course
  belongs_to :person
  belongs_to :location
  belongs_to :term

  # Accessor for the associated Course of a Section using the cache to limit database queries
  #
  # Returns:
  #
  #   * Cached Course associated with a given Section instance
  def cached_course
    Course.cached_find(course_id)
  end

  # Gets the coordinates of the associated Location using the cache to limit future database queries
  #
  # Returns:
  #
  #   * Cached RGeo point for the given Location's lonlat property
  def cached_coordinates
    Rails.cache.fetch([self, location]) { location.lonlat }
  end
end
