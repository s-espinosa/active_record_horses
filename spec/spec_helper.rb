ENV['RACK_ENV'] = 'test'
require 'rspec'
require 'database_cleaner'
require 'capybara/dsl'
require 'faker'


require File.expand_path('../../config/environment.rb', __FILE__)
Capybara.app = HorseApp

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
  c.include Capybara::DSL
end
