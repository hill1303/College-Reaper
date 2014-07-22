source 'https://rubygems.org'

# Travis CI requirement; probably not bad to have here anyway
gem 'rake'
# CodeClimate test coverage integration
gem 'codeclimate-test-reporter', group: :test, require: nil
# Needs to be here for the custom doc task
gem 'rdoc'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Let there be PostGIS
gem 'rgeo'
gem 'activerecord-postgis-adapter'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use Zurb Foundation as the display framework
gem 'foundation-rails', '~> 5.0'
# Add Font Awesome icons to the CSS available
gem 'font-awesome-sass'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Geocoding FTW
gem 'geocoder'
# Add in Devise to handle the user authentication
gem 'devise', '~> 3.2'
# And Omniauth for extension of the Devise system
gem 'omniauth', '~> 1.2.2'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

group :development, :test do
  # Add BetterErrors for detailed traces
  gem 'better_errors'
  gem 'binding_of_caller'
  # Use LetterOpener to view ActionMailer mailings in the browser
  gem 'letter_opener'
  # Use RSpec for testing
  gem 'rspec-rails', '~> 3.0.0'
  # Test with factories, not fixtures
  gem 'factory_girl_rails', '~> 4.4'
  # Make a null object pattern adapter available for unit testing
  gem 'activerecord-nulldb-adapter'
  # Use shoulda matchers for concise testing
  gem 'shoulda-matchers'
  # Make Capybara available for feature specs
  gem 'capybara', '~> 2.4'
  # Run JavaScript in Capybara tests
  gem 'poltergeist', '~> 1.5'
  # Add simplecov for coverage analysis
  gem 'simplecov', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

