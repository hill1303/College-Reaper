[![Code Climate](https://codeclimate.com/github/jimcavoli/College-Reaper.png)](https://codeclimate.com/github/jimcavoli/College-Reaper) [![Build Status](https://travis-ci.org/jimcavoli/College-Reaper.svg?branch=master)](https://travis-ci.org/jimcavoli/College-Reaper) [![Test Coverage](https://codeclimate.com/github/jimcavoli/College-Reaper/coverage.png)](https://codeclimate.com/github/jimcavoli/College-Reaper)[![Documentation](http://inch-ci.org/github/jimcavoli/College-Reaper.png?branch=master)](http://inch-ci.org/github/jimcavoli/College-Reaper)
------------------------------------------------------------------------------------------------------------------------

College-Reaper
==============
The SYN/ACK group's CSE 3901 final project at OSU, hopefully with future deployment into the wild. This is a Rails 4
application which uses PostgreSQL for the RDBMS. Other details can be gleaned from the information below and the
`Gemfile`.

Environment
-----------
The application is set up to use RVM and Bundler to standardize the environment. The current environment is, in RVM
shorthand, `ruby-2.1.2@cse3901`, which is MRI ruby, version 2.1.2 with no patches, and a gemset named `cse3901` for nice
isolation and organization. These are forced, assuming RVM is present, by the `.ruby-version` and `.ruby-gemset` files
in the project root. Running the `bundle install` command will install the gems for the application into the appropriate
gemset as well, under the same assumption.

Organization
------------
Code was organized using Rail's MVC concept. Public controller allowed for any user, logged in or not, to access metadata
including Terms of Use, About, Contact information. The CompletionController provides the user the ability to interact
with the website to add their past completed courses, and also to edit or remove them.


How to Execute College-Reaper
-----------------------------
From a terminal in your Rails development environment, type command:
 RAILS_ENV = development bundle exec rake db:drop db:create db:migrate db:seed
 rails server

 Web page should automatically pop up in your web browser, where you will see local host connected with
 the application. From the home page you are required to create a new account. Once logged in, click
 "Create Schedule" and enter any specific preferences on the next page. The "Next" button from the
 "Walking Distance" page will compute and load your schedule.

 Please allow some time for schedule to generate, as schedule-generator is computationally expensive.



Documentation
-------------
To generate the documentation for the application, use the `bundle exec rake doc:app_reaper` command. The
`doc:app_reaper` task uses the `sdoc` gem and will place it's output in `doc/app`, replacing the contents of the entire
directory, should any exist when the task runs.

Test Suite
----------
The test suite is written using the RSpec framework, and can be run with the `bundle exec rspec` command.
Reports on the effectiveness of test suite can be found under
                            /coverage/index.html
To test the database models and migrations, FactoryGirl was used to produce test data. After code completion,
many different possible user scenarios were tested against the system.

Contributions
-------------
All team members participated in the brainstorming and planning that went into designing College-Reaper. Once a
clearly defined plan was formed, code-writing was broken down in the following ways:

Jim Cavoli- Generated skeleton, implemented schedules_controller and associated views. Overall project manager
 who fairly delegated tasks and helped when needed. Also created User, Person

Ethan Hill- Implemented all methods in gen_schedule_helper module, following a complex scoring and sorting
algorithm. Worked on schedules_controller.

Gauri Mishra- Autocomplete widget, section/term/college models, specs and migrations. Implemented
completion_controller and was testing manager. Created db info in seeds.rb.

Elisabeth Holtman- Course, Location, Requirement_Group and Preference models, specs and migrations. Populated
database with seeds.rb file with Gauri, created bias_slider method, helped implement application_controller.

Dan Carlozzi- Used Foundation framework to create the look and feel of the application using customized
stylesheets and layout for the schedule. Incorporated Map API and contributed to public_controller.

