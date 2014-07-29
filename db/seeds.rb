# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

courses = Course.create([{
                             instructional_unit: 'CSE',
                             course_number: '2331',
                             name: 'Foundations 2',
                             credit_hours: 3
                         },
                         {
                             instructional_unit: 'CSE',
                             course_number: '2421',
                             name: 'Systems 1',
                             credit_hours: 3
                         },
                         {
                             instructional_unit: 'CSE',
                             course_number: '2431',
                             name: 'Systems 2',
                             credit_hours: 3
                         },
                         {
                             instructional_unit: 'CSE',
                             course_number: '2221',
                             name: 'Software 1',
                             credit_hours: 4
                         },
                         {
                             instructional_unit: 'MATH',
                             course_number: '1151',
                             name: 'Calculus 1',
                             credit_hours: 5
                         },
                         {
                             instructional_unit: 'PHYSICS',
                             course_number: '1251',
                             name: 'Mechanical Physics',
                             credit_hours: 5
                         }])

locations = Location.create([{
                                 name: 'Hagerty Hall',
                                 street1: 'Street Name',
                                 street2: nil,
                                 city: 'Anytown',
                                 state: 'OH NO',
                                 zip: '43210',
                                 latlong: 'POINT(39.998479 -83.01019)'
                             },
                             {
                                 name: 'Dreese Lab',
                                 street1: 'Street Name',
                                 street2: nil,
                                 city: 'Anytown',
                                 state: 'OH NO',
                                 zip: '43210',
                                 latlong: 'POINT(40.002241, -83.015965)'
                             },
                             {
                                 name: 'Caldwell Lab',
                                 street1: 'Street Name',
                                 street2: nil,
                                 city: 'Anytown',
                                 state: 'OH NO',
                                 zip: '43210',
                                 latlong: 'POINT(40.002471, -83.015145)'
                             },
                             {
                                 name: 'Fontana Lab',
                                 street1: 'Street Name',
                                 street2: nil,
                                 city: 'Anytown',
                                 state: 'OH NO',
                                 zip: '43210',
                                 latlong: 'POINT(40.003548, -83.012501)'
                             },
                             {
                                 name: 'Jennings Hall',
                                 street1: 'Street Name',
                                 street2: nil,
                                 city: 'Anytown',
                                 state: 'OH NO',
                                 zip: '43210',
                                 latlong: 'POINT(39.996793, -83.015366)'
                             }])

section_params = Array.new

50.times do |i|
  time_delta = 60 * rand(60..120)
  repeat_patterns = %w(MWF TR TWRF F)

  section_params.push({
      room: '10' << i.to_s,
      start_time: Time.at(36000 + time_delta),
      end_time: Time.at(39600 + time_delta),
      rpt_pattern: repeat_patterns.sample,
      open: true,
      course_seats: 40,
      wait_seats: 0,
      seat_max: 100,
      wait_max: 999,
      person: nil,
      term: nil,
      course: courses.sample,
      location: locations.sample
  })
end

Section.create(section_params)

college = College.create({ name: 'Arts and Sciences'})

CourseGroup.create([{
                      college: college,
                      college_global: false,
                      college_independent: false,
                      name: 'CIS',
                      courses: Course.where(instructional_unit: 'CSE')
                    },
                    {
                      college: college,
                      college_global: true,
                      college_independent: false,
                      name: 'ASC GE Math',
                      courses: Course.where(course_number: '1151')
                    }])

user = User.create({
                       uuid: '200085637',
                       rank: 3,
                       email: 'buckeye.1@osu.edu',
                       encrypted_password: 'nope',
                       course_groups: CourseGroup.where(name: 'CIS')
                   })

Preference.create({
                     user: user,
                     schedule: nil,
                     term: nil,
                     choices: {
                         num_courses: 3,
                         credit_min: 8,
                         credit_max: 18,
                         credit_lean: 0,
                         credit_lean_weight: 0.6,
                         distance_weight: 0.4,
                         ge_major_lean: 'major',
                         ge_major_lean_weight: 0.75,
                         waitlist: false,
                         start_time: Time.at(3600*11), # 6 AM, probably  \ These depend on the time zone
                         end_time: Time.at(3600*26), # 9 PM, probably    / currently set for -0500
                         time_weight: 0.3,
                         exclude_day_pattern: 'M'
                     }
                 })
