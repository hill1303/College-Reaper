# The Preference class represents the preferences expressed by a user. These include 
# importance of distance, class start time, class end time, waitlisting, maximum number of 
# classes and explicit courses. 
#
# A single attribute will store this information:
# * +:choices+
class Preference < ActiveRecord::Base
  belongs_to :user
  belongs_to :schedule
  belongs_to :term
end
