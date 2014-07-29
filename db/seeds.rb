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
                            instructional_unit: 'CSE',
                            course_number: '2501',
                            name: 'Ethics',
                            credit_hours: 1
                         },
                         {
                            instructional_unit: 'CSE',
                            course_number: '2321',
                            name: 'Foundations 1',
                            credit_hours: 3
                         },
                         {
                            instructional_unit: 'CSE',
                            course_number: '3241',
                            name: 'Database',
                            credit_hours: 3
                         },
                         {
                            instructional_unit: 'CSE',
                            course_number: '3231',
                            name: 'Software Eng',
                            credit_hours: 3
                         },
                         {
                            instructional_unit: 'CSE',
                            course_number: '3321',
                            name: 'Formal Languages',
                            credit_hours: 3
                         },
                         {
                            instructional_unit: 'CSE',
                            course_number: '3341',
                            name: 'Programming Languages',
                            credit_hours: 3
                         },
                         {
                            instructional_unit: 'CSE',
                            course_number: '3421',
                            name: 'Architecture',
                            credit_hours: 3
                         },
                         {
                            instructional_unit: 'CSE',
                            course_number: '3461',
                            name: 'Networking',
                            credit_hours: 3
                         },
                         {
                            instructional_unit: 'CSE',
                            course_number: '3521',
                            name: 'Artificial Intelligence',
                            credit_hours: 3
                         },
                         {
                            instructional_unit: 'CSE',
                            course_number: '3541',
                            name: 'Graphics',
                            credit_hours: 3
                         },
                         {
                            instructional_unit: 'CSE',
                            course_number: '3901',
                            name: 'Project: Web Apps',
                            credit_hours: 4
                         },
                         {
                           instructional_unit: 'CSE',
                           course_number: '5901',
                           name: 'Capstone',
                           credit_hours: 4
                        },
                        {
                           instructional_unit: 'Math',
                           course_number: '3345',
                           name: 'Foundations of Higher Math',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'MATH',
                           course_number: '1151',
                           name: 'Calculus I',
                           credit_hours: 5
                         },
                         {
                           instructional_unit: 'MATH',
                           course_number: '1152',
                           name: 'Calculus II',
                           credit_hours: 5
                         },
                         {
                           instructional_unit: 'STAT',
                           course_number: '3470',
                           name: 'Probability & Statistics',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'ECE',
                           course_number: '2000',
                           name:'Electrical &  Computer Engineering I',
                           credit_hours: 4
                         },
                         {
                           instructional_unit: 'PHYSICS',
                           course_number: '1250',
                           name: 'Mechanical Physics',
                           credit_hours: 5
                         },
                         {
                           instructional_unit: 'ENGLISH',
                           course_number: '1110',
                           name: 'Writing I',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'ENGLISH',
                           course_number: '2367',
                           name: 'Writing II',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'ENGLISH',
                           course_number: '3398',
                           name: 'Writing III',
                           credit_hours: 3
                         },
                         { 
                           instructional_unit: 'SWAHILI',
                           course_number: '1101',
                           name: 'Swahili I',
                           credit_hours: 4
                         },
                         {
                           instructional_unit: 'SWAHILI',
                           course_number: '1102',
                           name: 'Swahili II',
                           credit_hours: 4
                         },
                         {
                           instructional_unit: 'SWAHILI',
                           course_number: '1103',
                           name: 'Swahili III',
                           credit_hours: 4
                         },
                         {
                           instructional_unit: 'BIOLOGY',
                           course_number: '1113',
                           name: 'Biology I',
                           credit_hours: 4
                         },
                         {
                           instructional_unit: 'BIOLOGY',
                           course_number: '1114',
                           name: 'Biology II',
                           credit_hours: 4
                         },
                         {
                           instructional_unit: 'CHEMISTRY',
                           course_number: '1210',
                           name: 'Chemistry I',
                           credit_hours: 5
                         },
                         {
                           instructional_unit: 'CHEMISTRY',
                           course_number: '1220',
                           name: 'Chemistry II',
                           credit_hours: 5
                         },
                         {
                           instructional_unit: 'SOCIOLOGY',
                           course_number: '2210',
                           name: 'Sociological Aspects of Deviance',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'HISTORY',
                           course_number: '2204',
                           name: 'Modern European History',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'HISTORY',
                           course_number: '1681',
                           name: 'World History',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'HISTORY',
                           course_number: '2001',
                           name: 'History of Western Art',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'PSYCHOLOGY',
                           course_number: '3371',
                           name: ' Language and the Mind',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'CLASSICS',
                           course_number: '2220',
                           name: 'Greek and Roman Mythology',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'FILM STUDIES',
                           course_number: '2270',
                           name: 'Introduction to Theater',
                           credit_hours: 5
                         }, 
                         {
                           instructional_unit: 'ECONOMICS',
                           course_number: '3820',
                           name: 'Labor Economics',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'PHILOSOPHY',
                           course_number: '2367',
                           name: 'Social and Moral Problems in the U.S.',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'GEOGRAPHY',
                           course_number: '2400',
                           name: 'Economic and Social Geography',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'COMP STD',
                           course_number: '3607',
                           name: 'Film and Literature as Narrative Art',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'ARCHITECTURE',
                           course_number: '2220',
                           name: 'Sustainability in the Built Environment',
                           credit_hours: 3
                         },
                         {
                           instructional_unit: 'WGSS',
                           course_number: '2230',
                           name: 'Gender, Sexuality, and Race in Popular Culture',
                           credit_hours: 3
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
                                 name: 'Bolz Hall',
                                 street1: '2036 Neil Ave Mall',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.002992, -83.015160)'
                             },
                             {
                                 name: 'Knowlton Hall',
                                 street1: '275 W Woodruff Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.003621, -83.016619)'
                             },
                             {
                                 name: 'Smith Lab',
                                 street1: '174 W 18th Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.002679, -83.013223)'
                             },
                             {
                                 name: 'Mathematics Tower  ',
                                 street1: ' 231 W 18th Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.001575, -83.014064)'
                             },
                             {
                                 name: 'University Hall',
                                 street1: ' 230 N Oval Mall',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 latlong: 'POINT(40.000479, -83.014178)'
                             }])

people = Person.create([
                  {
                     name: 'Ada Lovelace',
                     dob: Date.new(1970,8,4),
                     sex: 'Female',
                     gender: 'Androgynous',
                     pronoun: 'her',
                     title: 'Ms.',
                     suffix: 'LL.D.',
                 },
                 {
                     name: 'Albert Einstein',
                     dob: Date.new(1980,5,4),
                     sex: 'Male',
                     gender: 'Male',
                     pronoun: 'his',
                     title: 'Mr.',
                     suffix: 'Ph.D.',
                 },
                 {
                     name: 'Isaac Newton',
                     dob: Date.new(1980,5,4),
                     sex: 'Male',
                     gender: 'Male',
                     pronoun: 'his',
                     title: 'Mr.',
                     suffix: 'Ph.D.'
                 },
                 {
                     name: 'Madam Marie Curie',
                     dob: Date.new(1970,2,4),
                     sex: 'Female',
                     gender: 'Female',
                     pronoun: 'her',
                     title: 'Ms.',
                     suffix: 'Ph.D.',
                 },       
                 {
                     name: 'Rachel Carson',
                     dob: Date.new(1940,6,4),
                     sex: 'Female',
                     gender: 'Female',
                     pronoun: 'her',
                     title: 'Ms.',
                     suffix: 'Ph.D.'
                 },
                 {
                     name: 'Elizabeth Blackwell',
                     dob: Date.new(1970,9,5),
                     sex: 'Female',
                     gender: 'Female',
                     pronoun: 'her',
                     title: 'Dr.',
                     suffix: 'Ph.D.'
                 },
                 {   
                     name: 'James Prescott Joule',
                     dob: Date.new(1960,9,5),
                     sex: 'Male',
                     gender: 'Male',
                     pronoun: 'his',
                     title: 'Dr.',
                     suffix: 'Ph.D.'
                 }])

section_params = Array.new

300.times do |i|
  time_delta = 60 * rand(60..120)
  repeat_patterns = %w(MWF TR TWRF F WF MW M T W R MTWR)

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

college = College.create({ name: 'Arts and Sciences' })

CourseGroup.create([{
                      college: college,
                      college_global: false,
                      college_independent: false,
                      name: 'CIS',
                      courses: Course.where('instructional_unit = ? OR course_number = ? OR instructional_unit = ? OR instructional_unit = ?', 'CSE', '3345', 'ECE', 'STAT')
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
                      name: 'ASC GE Writing',
                      courses: Course.where(instructional_unit: 'ENGLISH' )
                    },
                    {
                      college: college,
                      college_global: true,
                      college_independent: false,
                      name: 'ASC GE Math',
                      courses: Course.where(['instructional_unit = ? AND course_number <> ?', 'MATH', '3345'])
                    },
                    {
                      college: college,
                      college_global: true,
                      college_independent: false,
                      name: 'ASC GE Social Science',
                      courses: Course.where(['instructional_unit = ? OR instructional_unit= ? OR instructional_unit= ? ', 'PSYCHOLOGY', 'SOCIOLOGY', 'ARCHITECTURE'])
                    },
                    {
                      college: college,
                      college_global: true,
                      college_independent: false,
                      name: 'ASC GE Arts And Humanities',
                      courses: Course.where(['instructional_unit = ? OR instructional_unit= ? OR instructional_unit= ? ', 'CLASSICS', 'COMP STD', 'FILM STUDIES'])
                    },
                    ])

user_person = Person.create({
                              name: 'Brutus Buckeye',
                              dob: Date.new(1870,9,17),
                              sex: 'Male',
                              gender: 'Male',
                              pronoun: 'his',
                              title: 'Mr.',
                              suffix: 'Sr.'
                            })

user = User.create({
                       uuid: '200085637',
                       rank: 3,
                       email: 'buckeye.1@osu.edu',
                       password: 'password',
                       password_confirmation: 'password',
                       course_groups: CourseGroup.where(name: 'CIS'),
                       person: user_person
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
                  },
                  {
                     user: user,
                     course: Course.where(instructional_unit: 'PSYCHOLOGY').find_by_course_number('3371'),
                     grade: 'A'
                   },
                   {
                     user: user,
                     course: Course.where(instructional_unit: 'CHEMISTRY').find_by_course_number('1210'),
                     grade: 'B-'
                   },
                   {
                     user: user,
                     course: Course.where(instructional_unit: 'ARCHITECTURE').find_by_course_number('2220'),
                     grade: 'A'
                   },
                   {
                     user: user,
                     course: Course.where(instructional_unit: 'CSE').find_by_course_number('2221'),
                     grade: 'C-'
                   },
                   {
                     user: user,
                     course: Course.where(instructional_unit: 'CSE').find_by_course_number('2231'),
                     grade: 'C'
                   },
                   {
                     user: user,
                     course: Course.where(instructional_unit: 'CSE').find_by_course_number('2321'),
                     grade: 'B'
                   },
                   {
                     user: user,
                     course: Course.where(instructional_unit: 'CSE').find_by_course_number('2421'),
                     grade: 'B-'
                   },
                   {
                     user: user,
                     course: Course.where(instructional_unit: 'CSE').find_by_course_number('3901'),
                     grade: 'E'
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
                  pronoun: 'him',
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
  ])
