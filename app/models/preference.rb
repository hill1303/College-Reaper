# The Preference class represents the preferences expressed by a user. These include importance of distance, class start
# time, class end time, waitlisting, maximum number of classes and explicit courses.
#
# A single attribute will store this information:
#   * +:choices+ is a hash of all the user's preferences, stored as an hstore column so as to be query-able as well
class Preference < ActiveRecord::Base
  store_accessor :choices, :num_courses, :credit_min, :credit_max, :credit_lean, :credit_lean_weight, :distance_weight,
                 :ge_major_lean, :ge_major_lean_weight, :waitlist, :start_time, :end_time, :time_weight,
                 :exclude_day_pattern

  validates :num_courses, presence: true, numericality: true
  validates :credit_min, presence: true, numericality: true
  validates :credit_max, presence: true, numericality: true
  validates :credit_lean_weight, presence: true, numericality: true
  validates :distance_weight, presence: true, numericality: true
  validates :ge_major_lean_weight, presence: true, numericality: true
  validates :time_weight, presence: true, numericality: true

  # Access the preferred courses
  attr_accessor :force_courses

  belongs_to :user
  belongs_to :schedule
  belongs_to :term

  def cached_user
    Rails.cache.fetch([self, user]) { user }
  end
end
