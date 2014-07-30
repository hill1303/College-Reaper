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

Documentation
-------------
To generate the documentation for the application, use the `bundle exec rake doc:app_reaper` command. The
`doc:app_reaper` task uses the `sdoc` gem and will place it's output in `doc/app`, replacing the contents of the entire
directory, should any exist when the task runs.

Test Suite
----------
The test suite is written using the RSpec framework, and can be run with the `bundle exec rspec` command.
To test the database models and migrations, FactoryGirl was used to produce test data. After code completion,
many different possible user scenarios were tested against the system.

Contributions
-------------
All team members contributed in the brainstorming and planning that went into designing College-Reaper. Although
Ethan Hill


