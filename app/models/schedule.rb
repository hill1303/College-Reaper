# The Schedule class represents a possible schedule for the user. It will be scored based on a scheduling algorithm
# with which all possible schedules will be compared. The schedules with the highest scores will be presented to a 
# user.
# Attributes are as followed:
#
#   * +:score+ is the total computed score for a schedule based on preferences
#   * +:sub_score+ will store all scores per preference, used to find overall score
class Schedule < ActiveRecord::Base
  validates :score, presence: true, numericality: true

  belongs_to :user
  has_and_belongs_to_many :sections
  belongs_to :term
  has_one :preference
end