# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
term = Term.create({
                       name: 'Autumn 2014',
                       start_date: Date.new(2014, 8, 27),
                       end_date: Date.new(2014, 12, 07)
                   })

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
                            name: 'Software I',
                            credit_hours: 4
                         },
                         {
                            instructional_unit: 'CSE',
                            course_number: '2231',
                            name: 'Software II',
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
                           course_number: '5911',
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
                           name: 'Language and the Mind',
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
                                 lonlat: 'POINT(39.998479 -83.01019)'
                             },
                             {
                                 name: 'Dreese Lab',
                                 street1: '2015 Neil Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(40.002241 -83.015965)'
                             },
                             {
                                 name: 'Caldwell Lab',
                                 street1: '2024 Neil Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(40.002471 -83.015145)'
                             },
                             {
                                 name: 'Fontana Lab',
                                 street1: '99 W Woodruff Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(40.003548 -83.012501)'
                             },
                             {
                                 name: 'Jennings Hall',
                                 street1: 'W 12th Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(39.996793 -83.015366)'
                             },
                             {
                                 name: 'Bolz Hall',
                                 street1: '2036 Neil Ave Mall',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(40.002992 -83.015160)'
                             },
                             {
                                 name: 'Smith Lab',
                                 street1: '174 W 18th Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(40.002679 -83.013223)'
                             },
                             {
                                 name: 'Mathematics Tower',
                                 street1: ' 231 W 18th Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(40.001575 -83.014064)'
                             },
                             {
                                 name: 'University Hall',
                                 street1: ' 230 N Oval Mall',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(40.000479 -83.014178)'
                             },
                             {
                                 name: 'Postle Hall',
                                 street1: '305 W 12th Ave',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(39.996288 -83.016292)'
                             },
                             {
                                 name: 'Drake Performance and Event Center',
                                 street1: '1849 Cannon Dr',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(39.999296 -83.022918)'
                             },
                             {
                                 name: 'Enarson Classrooms Building',
                                 street1: '2009 Millikin Rd',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(40.002272 -83.016105)'
                             },
                             {
                                 name: 'Kottman Hall',
                                 street1: '2021 Coffey Rd',
                                 street2: nil,
                                 city: 'Columbus',
                                 state: 'OH',
                                 zip: '43210',
                                 lonlat: 'POINT(39.996793 -83.015366)'
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
                 },
                 {
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
                }])

section_params = Array.new

100.times do |i|
  time_delta = 60 * rand(60..120)
  repeat_patterns = %w(MWF TR TWRF WF MW MTWR)

  section_params.push({
      room: '10' << i.to_s,
      start_time: Time.parse("08:00:00") + time_delta,
      end_time: Time.parse("14:00:00") + time_delta,
      rpt_pattern: repeat_patterns.sample,
      open: true,
      course_seats: 40,
      wait_seats: 0,
      seat_max: 100,
      wait_max: 999,
      person: people.sample,
      term: term,
      course: courses.sample,
      location: locations.sample
  })
end

Section.create([{
                    room: '280',
                    start_time: Time.parse("08:00:00"),
                    end_time: Time.parse("08:55:00"),
                    rpt_pattern: 'TWRF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Isaac Newton'),
                    term: term,
                    course: Course.find_by_name('Software I'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '280',
                    start_time: Time.parse("11:30:00"),
                    end_time: Time.parse("12:25:00"),
                    rpt_pattern: 'TWRF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Isaac Newton'),
                    term: term,
                    course: Course.find_by_name('Software I'),
                    location: Location.find_by_name('Dreese Lab')
                },
                {
                    room: '280',
                    start_time: Time.parse("15:00:00"),
                    end_time: Time.parse("15:55:00"),
                    rpt_pattern: 'TWRF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Jimmy Newtron'),
                    term: term,
                    course: Course.find_by_name('Software I'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '280',
                    start_time: Time.parse("17:20:00"),
                    end_time: Time.parse("18:15:00"),
                    rpt_pattern: 'TWRF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Jimmy Newtron'),
                    term: term,
                    course: Course.find_by_name('Software I'),
                    location: Location.find_by_name('Dreese Lab')
                },
                {
                    room: '357',
                    start_time: Time.parse("08:00:00"),
                    end_time: Time.parse("08:55:00"),
                    rpt_pattern: 'TWRF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Jimmy Newtron'),
                    term: term,
                    course: Course.find_by_name('Software II'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '357',
                    start_time: Time.parse("10:20:00"),
                    end_time: Time.parse("11:15:00"),
                    rpt_pattern: 'TWRF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Jimmy Newtron'),
                    term: term,
                    course: Course.find_by_name('Software II'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '357',
                    start_time: Time.parse("13:50:00"),
                    end_time: Time.parse("14:45:00"),
                    rpt_pattern: 'TWRF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Isaac Newton'),
                    term: term,
                    course: Course.find_by_name('Software II'),
                    location: Location.find_by_name('Dreese Lab')
                },
                {
                    room: '357',
                    start_time: Time.parse("16:10:00"),
                    end_time: Time.parse("17:05:00"),
                    rpt_pattern: 'TWRF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Isaac Newton'),
                    term: term,
                    course: Course.find_by_name('Software II'),
                    location: Location.find_by_name('Dreese Lab')
                },
                {
                    room: '369',
                    start_time: Time.parse("09:10:00"),
                    end_time: Time.parse("10:05:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Ada Lovelace'),
                    term: term,
                    course: Course.find_by_name('Foundations 1'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '369',
                    start_time: Time.parse("12:40:00"),
                    end_time: Time.parse("13:35:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Albert Einstein'),
                    term: term,
                    course: Course.find_by_name('Foundations 1'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '369',
                    start_time: Time.parse("15:00:00"),
                    end_time: Time.parse("15:55:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Isaac Newton'),
                    term: term,
                    course: Course.find_by_name('Foundations 1'),
                    location: Location.find_by_name('Dreese Lab')
                },
                {
                    room: '357',
                    start_time: Time.parse("19:00:00"),
                    end_time: Time.parse("20:20:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Madam Marie Curie'),
                    term: term,
                    course: Course.find_by_name('Foundations 1'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '264',
                    start_time: Time.parse("09:10:00"),
                    end_time: Time.parse("10:05:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Ada Lovelace'),
                    term: term,
                    course: Course.find_by_name('Foundations 2'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '264',
                    start_time: Time.parse("12:40:00"),
                    end_time: Time.parse("13:35:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Albert Einstein'),
                    term: term,
                    course: Course.find_by_name('Foundations 2'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '305',
                    start_time: Time.parse("13:50:00"),
                    end_time: Time.parse("14:45:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Isaac Newton'),
                    term: term,
                    course: Course.find_by_name('Foundations 2'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '305',
                    start_time: Time.parse("11:30:00"),
                    end_time: Time.parse("12:25:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Madam Marie Curie'),
                    term: term,
                    course: Course.find_by_name('Foundations 2'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '369',
                    start_time: Time.parse("08:00:00"),
                    end_time: Time.parse("10:05:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Madam Marie Curie'),
                    term: term,
                    course: Course.find_by_name('Systems 1'),
                    location: Location.find_by_name('Dreese Lab')
                },
                {
                    room: '198',
                    start_time: Time.parse("09:10:00"),
                    end_time: Time.parse("10:05:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Rachel Carson'),
                    term: term,
                    course: Course.find_by_name('Systems 1'),
                    location: Location.find_by_name('Dreese Lab')
                },
                {
                    room: '40',
                    start_time: Time.parse("15:00:00"),
                    end_time: Time.parse("17:05:00"),
                    rpt_pattern: 'WF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Elizabeth Blackwell'),
                    term: term,
                    course: Course.find_by_name('Systems 1'),
                    location: Location.find_by_name('Dreese Lab')
                },
                {
                    room: '80',
                    start_time: Time.parse("16:10:00"),
                    end_time: Time.parse("18:15:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Meean Feerash'),
                    term: term,
                    course: Course.find_by_name('Systems 1'),
                    location: Location.find_by_name('Dreese Lab')
                },
                {
                    room: '10',
                    start_time: Time.parse("14:20:00"),
                    end_time: Time.parse("15:40:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Rachel Carson'),
                    term: term,
                    course: Course.find_by_name('Systems 2'),
                    location: Location.find_by_name('Bolz Hall')
                },
                {
                    room: '198',
                    start_time: Time.parse("09:35:00"),
                    end_time: Time.parse("10:55:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Meean Feerash'),
                    term: term,
                    course: Course.find_by_name('Systems 2'),
                    location: Location.find_by_name('Bolz Hall')
                },
                {
                    room: '305',
                    start_time: Time.parse("12:45:00"),
                    end_time: Time.parse("14:05:00"),
                    rpt_pattern: 'WF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Elizabeth Blackwell'),
                    term: term,
                    course: Course.find_by_name('Systems 2'),
                    location: Location.find_by_name('Dreese Lab')
                },
                {
                    room: '480',
                    start_time: Time.parse("11:10:00"),
                    end_time: Time.parse("12:30:00"),
                    rpt_pattern: 'MW',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Madam Marie Curie'),
                    term: term,
                    course: Course.find_by_name('Systems 2'),
                    location: Location.find_by_name('Dreese Lab')
                },

                {
                    room: '305',
                    start_time: Time.parse("08:00:00"),
                    end_time: Time.parse("09:20:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Ada Lovelace'),
                    term: term,
                    course: Course.find_by_name('Database'),
                    location: Location.find_by_name('Bolz Hall')
                },
                {
                    room: '317',
                    start_time: Time.parse("16:30:00"),
                    end_time: Time.parse("17:50:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Aubrey Hawkins'),
                    term: term,
                    course: Course.find_by_name('Database'),
                    location: Location.find_by_name('Enarson Classrooms Building')
                },
                {
                    room: '226',
                    start_time: Time.parse("14:20:00"),
                    end_time: Time.parse("15:40:00"),
                    rpt_pattern: 'WF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Isaac Newton'),
                    term: term,
                    course: Course.find_by_name('Database'),
                    location: Location.find_by_name('Dreese Lab')
                },
                {
                    room: '480',
                    start_time: Time.parse("11:10:00"),
                    end_time: Time.parse("12:30:00"),
                    rpt_pattern: 'MW',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Aubrey Hawkins'),
                    term: term,
                    course: Course.find_by_name('Database'),
                    location: Location.find_by_name('Caldwell Lab')
                },
                {
                    room: '225',
                    start_time: Time.parse("11:10:00"),
                    end_time: Time.parse("12:30:00"),
                    rpt_pattern: 'WR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Rachel Carson'),
                    term: term,
                    course: Course.find_by_name('Writing I'),
                    location: Location.find_by_name('Mathematics Tower')
                },
                {
                    room: '155',
                    start_time: Time.parse("09:35:00"),
                    end_time: Time.parse("10:50:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Albert Einstein'),
                    term: term,
                    course: Course.find_by_name('Writing I'),
                    location: Location.find_by_name('University Hall')
                },
                {
                    room: '369',
                    start_time: Time.parse("09:35:00"),
                    end_time: Time.parse("10:55:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Rachel Carson'),
                    term: term,
                    course: Course.find_by_name('Writing II'),
                    location: Location.find_by_name('Mathematics Tower')
                },
                {
                    room: '416',
                    start_time: Time.parse("17:35:00"),
                    end_time: Time.parse("20:30:00"),
                    rpt_pattern: 'W',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Ada Lovelace'),
                    term: term,
                    course: Course.find_by_name('Writing II'),
                    location: Location.find_by_name('University Hall')
                },
                {
                    room: '211',
                    start_time: Time.parse("10:20:00"),
                    end_time: Time.parse("11:15:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('James Prescott Joule'),
                    term: term,
                    course: Course.find_by_name('Calculus I'),
                    location: Location.find_by_name('Mathematics Tower')
                },
                {
                    room: '330',
                    start_time: Time.parse("09:35:00"),
                    end_time: Time.parse("10:50:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Meean Feerash'),
                    term: term,
                    course: Course.find_by_name('Calculus I'),
                    location: Location.find_by_name('Mathematics Tower')
                },
                {
                    room: '180',
                    start_time: Time.parse("08:00:00"),
                    end_time: Time.parse("08:55:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('James Prescott Joule'),
                    term: term,
                    course: Course.find_by_name('Calculus II'),
                    location: Location.find_by_name('Mathematics Tower')
                },
                {
                    room: '170',
                    start_time: Time.parse("13:50:00"),
                    end_time: Time.parse("14:45:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Meean Feerash'),
                    term: term,
                    course: Course.find_by_name('Calculus II'),
                     location: Location.find_by_name('Mathematics Tower')
                },
                {
                    room: '209',
                    start_time: Time.parse("10:20:00"),
                    end_time: Time.parse("11:15:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Aubrey Hawkins'),
                    term: term,
                    course: Course.find_by_name('Foundations of Higher Math'),
                    location: Location.find_by_name('Jennings Hall')
                },
                {
                    room: '130',
                    start_time: Time.parse("13:50:00"),
                    end_time: Time.parse("14:45:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Jimmy Neutron'),
                    term: term,
                    course: Course.find_by_name('Foundations of Higher Math'),
                    location: Location.find_by_name('Mathematics Tower')
                },
                {
                    room: '354',
                    start_time: Time.parse("15:55:00"),
                    end_time: Time.parse("17:15:00"),
                    rpt_pattern: 'TR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Meean Feerash'),
                    term: term,
                    course: Course.find_by_name('Foundations of Higher Math'),
                    location: Location.find_by_name('Hagerty Hall')
                },
                {
                    room: '354',
                    start_time: Time.parse("10:20:00"),
                    end_time: Time.parse("11:15:00"),
                    rpt_pattern: 'WRF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Thomas Edison'),
                    term: term,
                    course: Course.find_by_name('Foundations of Higher Math'),
                    location: Location.find_by_name('Postle Hall')
                },
                {
                    room: '224',
                    start_time: Time.parse("10:20:00"),
                    end_time: Time.parse("12:15:00"),
                    rpt_pattern: 'MW',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Isaac Newton'),
                    term: term,
                    course: Course.find_by_name('Mechanical Physics'),
                    location: Location.find_by_name('Smith Lab')
                },
                {
                    room: '224',
                    start_time: Time.parse("15:55:00"),
                    end_time: Time.parse("17:15:00"),
                    rpt_pattern: 'MW',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Isaac Newton'),
                    term: term,
                    course: Course.find_by_name('Mechanical Physics'),
                    location: Location.find_by_name('Smith Lab')
                },
                {
                    room: '367',
                    start_time: Time.parse("10:05:00"),
                    end_time: Time.parse("11:55:00"),
                    rpt_pattern: 'TWR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Ada Lovelace'),
                    term: term,
                    course: Course.find_by_name('Social and Moral Problems in the U.S.'),
                    location: Location.find_by_name('Hagerty Hall')
                },
                {
                    room: '367',
                    start_time: Time.parse("12:05:00"),
                    end_time: Time.parse("13:55:00"),
                    rpt_pattern: 'TWR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Ada Lovelace'),
                    term: term,
                    course: Course.find_by_name('Social and Moral Problems in the U.S.'),
                    location: Location.find_by_name('Hagerty Hall')
                },
                {
                    room: '100',
                    start_time: Time.parse("08:00:00"),
                    end_time: Time.parse("08:55:00"),
                    rpt_pattern: 'TWR',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Elizabeth Blackwell'),
                    term: term,
                    course: Course.find_by_name('Biology I'),
                    location: Location.find_by_name('Kottman Hall')
                },
                {
                    room: '100',
                    start_time: Time.parse("13:00:00"),
                    end_time: Time.parse("14:55:00"),
                    rpt_pattern: 'MTWRF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Elizabeth Blackwell'),
                    term: term,
                    course: Course.find_by_name('Biology I'),
                    location: Location.find_by_name('Kottman Hall')
                },
                {
                    room: '100',
                    start_time: Time.parse("17:00:00"),
                    end_time: Time.parse("17:55:00"),
                    rpt_pattern: 'MTWRF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Elizabeth Blackwell'),
                    term: term,
                    course: Course.find_by_name('Biology I'),
                    location: Location.find_by_name('Kottman Hall')
                },
                {
                    room: '120',
                    start_time: Time.parse("13:30:00"),
                    end_time: Time.parse("14:25:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Jimmy Neutron'),
                    term: term,
                    course: Course.find_by_name('Greek and Roman Mythology'),
                    location: Location.find_by_name('University Hall')
                },
                {
                    room: '120',
                    start_time: Time.parse("10:30:00"),
                    end_time: Time.parse("11:25:00"),
                    rpt_pattern: 'MWF',
                    open: true,
                    course_seats: 40,
                    wait_seats: 0,
                    seat_max: 100,
                    wait_max: 999,
                    person: Person.find_by_name('Jimmy Neutron'),
                    term: term,
                    course: Course.find_by_name('Greek and Roman Mythology'),
                    location: Location.find_by_name('University Hall')
                }
                ])

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

Schedule.create([
                    score: 0,
                    sub_scores: Hash.new,
                    user: user,
                    :sections => Section.where(['id IN (?, ?, ?, ?)', Section.course.find_by_name('Software I'),
                                                Section.course.find_by_name('Foundations 1'), Section.course.find_by_name('Writing I'),
                                                Section.course.find_by_name('Calculus I')]),
                    term: term
                ])

Preference.create({
                     user: user,
                     schedule: nil,
                     term: term,
                     choices: {
                         num_courses: 3,
                         credit_min: 8,
                         credit_max: 18,
                         credit_lean: 'high',
                         credit_lean_weight: 0.5333333333333334,
                         distance_weight: 0.28,
                         ge_major_lean: 'major',
                         ge_major_lean_weight: 0.7777777777777778,
                         waitlist: false,
                         start_time: Time.parse("06:00:00"), # 6 AM, probably  \ These depend on the time zone
                         end_time: Time.parse("21:00:00"), # 9 PM, probably    / currently set for -0500
                         time_weight: 0.78,
                         exclude_day_pattern: "UWS"
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

RequirementGroup.create([
  {
    name: 'Major',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'CSE').find_by_course_number('3901'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND (course_number = ? OR course_number = ? OR course_number = ?)', 'CSE', '2231', '2321', '2421'])
  },
  {
    name: 'Major',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'CSE').find_by_course_number('3521'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND  course_number = ?', 'CSE', '2331']) 
  },
  {
    name: 'Major',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'CSE').find_by_course_number('2231'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND  course_number = ?', 'CSE', '2221']) 
  },
  {
    name: 'Major',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'CSE').find_by_course_number('5911'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND  course_number = ?', 'CSE', '3901']) 
  },
  {
    name: 'Major',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'CSE').find_by_course_number('2321'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND  course_number = ?', 'CSE', '2221']) 
  },
  {
    name: 'Major',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'CSE').find_by_course_number('2331'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND  course_number = ?', 'CSE', '2321']) 
  },
  {
    name: 'Major',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'CSE').find_by_course_number('2421'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND (course_number = ? OR course_number = ?)','CSE','2231','2321']) 
  },
  {
    name: 'Major',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'CSE').find_by_course_number('2431'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND course_number = ?','CSE','2421']) 
  },
  {
    name: 'GEC',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'CHEMISTRY').find_by_course_number('1220'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND course_number = ?','CHEMISTRY','1210']) 
  },
  {
    name: 'GEC',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'MATH').find_by_course_number('1152'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND course_number = ?','MATH','1151']) 
  },
  {
    name: 'Major',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'MATH').find_by_course_number('3345'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND course_number = ?','CSE','2321']) 
  },
  {
  name: 'GEC',
  rule: 'Pre req',
  owner_id: Course.where(instructional_unit: 'ENGLISH').find_by_course_number('2367'),
  owner_type: 'Course',
  courses: Course.where(['instructional_unit = ? AND course_number = ?','ENGLISH','1110']) 
  },
  {
    name: 'GEC',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'ENGLISH').find_by_course_number('3398'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND course_number = ?','ENGLISH','2367']) 
  },
  {
    name: 'GEC',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'SWAHILI').find_by_course_number('1102'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND course_number = ?','SWAHILI','1101']) 
  },
  {
    name: 'GEC',
    rule: 'Pre req',
    owner_id: Course.where(instructional_unit: 'SWAHILI').find_by_course_number('1103'),
    owner_type: 'Course',
    courses: Course.where(['instructional_unit = ? AND course_number = ?','SWAHILI','1102']) 
  }
  ])
