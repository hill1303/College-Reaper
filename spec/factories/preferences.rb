FactoryGirl.define do
  factory :preference do
    choices({
              num_courses: 3,
              credit_min: 8,
              credit_max: 18,
              credit_lean: 'low',
              credit_lean_weight: 0.6,
              distance_weight: 0.4,
              ge_major_lean: 'major',
              ge_major_lean_weight: 0.75,
              waitlist: false,
              start_time: Time.at(36000*11), # 6 AM   These depend on the time zone
              end_time: Time.at(39600*26), # 9 PM     currently set for -0500
              time_weight: 0.3,
              exclude_day_pattern: 'M'
            })
  end
end
