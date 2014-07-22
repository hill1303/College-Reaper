# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

# Get FactoryGirl into scope
require 'factory_girl'

# Make Capybara DSL available in appropriate places
require 'capybara/rspec'

# Bring in the NullDB libraries and matchers and such
require 'nulldb_rspec'

# Add the shoulda matchers
require 'shoulda/matchers'

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Bring in Factory Girl
  config.include FactoryGirl::Syntax::Methods

  # Enforce null object pattern adapter usage for unit tests on models except those flagged with :db
  # Thanks to the Robbie Clutton at PivotalLabs http://pivotallabs.com/testing-strategies-rspec-nulldb-nosql/
  config.around(:each, type: :model, db: false) do |example|
    NullDB.nullify
    example.run
    NullDB.restore
  end

  # Set the geocoder to provide certain consistent results for testing the geocoding features in the app
  # noinspection RubyStringKeysInHashInspection
  config.before(:all) do
    Geocoder.configure(lookup: :test)

    Geocoder::Lookup::Test.add_stub(
      'New York, NY', [
        {
            'latitude'     => 40.7143528,
            'longitude'    => -74.0059731,
            'address'      => 'New York, NY, USA',
            'state'        => 'New York',
            'state_code'   => 'NY',
            'country'      => 'United States',
            'country_code' => 'US'
        }
      ]
    )
  end
end


# José Valim wrote the code below these comments...it will run all specs through a single, shared DB connection.
# It monkeys with ActiveRecord internals to do that. He's on the Rails core team; you're not, so don't touch it.
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

# Forces all threads to share the same connection. This works on Capybara because it starts the web server in a thread.
# Also necessary for the sake of PhantomJS working properly through the Poltergeist gem (headless) with Capybara.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
