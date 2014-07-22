FactoryGirl.define  do
  factory :section do
    room          '104'
    start_time    Time.at(36000) # 1970-01-01 05:00:00 -0500
    end_time      Time.at(39600) # 1970-01-01 06:00:00 -0500
    rpt_pattern   'MWF'
    open          false
    course_seats  30
    wait_seats    10
    seat_max      40
    wait_max      999
  end
end