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
                         }])

locations = Location.create([{
                                 name: 'Hagerty Hall',
                                 street1: '1775 Oval Dr S',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(39.998479 -83.01019)'
                             },
                             {
                                 name: 'Dreese Lab',
                                 street1: '2015 Neil Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.002241, -83.015965)'
                             },
                             {
                                 name: 'Caldwell Lab',
                                 street1: '2024 Neil Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.002471, -83.015145)'
                             },
                             {
                                 name: 'Fontana Lab',
                                 street1: '99 W Woodruff Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.003548, -83.012501)'
                             },
                             {
                                 name: 'Jennings Hall',
                                 street1: 'W 12th Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(39.996793, -83.015366)'
                             },
                             {
                                 name: 'Baker Systems',
                                 street1: '1971 Neil Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.001611, -83.015912)'
                             },
                             {
                                 name: 'Denney Hall',
                                 street1: 'W 17th Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.001293, -83.012486)'
                             },
                             {
                                 name: 'Denney Hall',
                                 street1: 'W 17th Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.001293, -83.012486)'
                             },
                             {
                                 name: 'Hitchcock Hall',
                                 street1: '2070 Neil Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.003864, -83.015003)'
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
      person: people.sample,
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
                      courses: Course.where('instructional_unit = ? OR course_number = ? OR instructional_unit = ? OR instructional_unit,' 'CSE', '3345', 'ECE', 'STAT')
                    },
                    {
                      college: college,
                      college_global: true,
                      college_independent: false,
                      name: 'ASC GE Math',
                      courses: Course.where(course_number: '1151')
                    },
                    {
                      college: college,
                      college_global: true,
                      college_independent: false,
                      name: 'ASC GE Foreign Language',
                      courses: Course.where(instructional_unit: 'SWAHILI')
                    },
                    {
                      college: college,
                      college_global: true,
                      college_independent: false,
                      name: 'ASC GE Natural Science',
                      courses: Course.where('instructional_unit = ? OR instructional_unit = ?', 'CHEMISTRY', 'BIOLOGY')
                    },
                    {
                      college: college,
                      college_global: true,
                      college_independent: false,
                      name: 'ASC GE History',
                      courses: Course.where(instructional_unit: 'HISTORY')
                    }])

user = User.create({
                       uuid: '200085637',
                       rank: 3,
                       email: 'buckeye.1@osu.edu',
                       encrypted_password: 'nope',
                       course_groups: CourseGroup.where(name: 'CIS'),
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

Completion.create([{
                      user: user,
                      course: Course.where(instructional_unit: 'MATH').find_by_course_number('1151'),
                      grade: 'B+'
                  },
                  {
                      user: user,
                      course: Course.where(instructional_unit: 'BIOLOGY').find_by_course_number('1113'),
                      grade: 'C'
                  },
                  {
                      user: user,
                      course: Course.where(instructional_unit: 'STAT').find_by_course_number('3470'),
                      grade: 'A-'
                  }])

people = Person.create([{
                  name: 'Meean Feerash',
                  dob: Date.new(1970, 8, 11),
                  sex: 'Female',
                  pronoun: 'her',
                  title: 'Prof.',
                  suffix: ''
                },
                {
                  name: 'Thomas Edison',
                  dob: Date.new(1956, 2, 29),
                  sex: 'Male',
                  pronoun: 'him',
                  title: 'Mr.',
                  suffix: 'Ph.D.'
                },
                {
                  name: 'Jimmy Neutron',
                  dob: Date.new(1988, 11, 8),
                  sex: 'Male',
                  pronoun: 'him'
                  title: 'Mr.',
                  suffix: ''
                },
                {
                  name: 'Aubrey Hawkins',
                  dob: Date.new(1956, 2, 29),
                  sex: 'Female',
                  pronoun: 'her',
                  title: 'Mrs.',
                  suffix: ''
                }
  }])
}
