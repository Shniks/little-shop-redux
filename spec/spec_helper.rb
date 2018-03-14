ENV["RACK_ENV"] ||= "test"
#require 'bundler'
#Bundler.require(:default, :test)

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'

Capybara.app = LittleShopApp

RSpec.configure do |c|
  c.include Capybara::DSL
end

=begin
DatabaseCleaner.strategy = :truncation #Truncates all data and resets auto ids

RSpec.configure do |c| # scrubs the database before and after each test
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:all) do
    DatabaseCleaner.clean
  end
end

=end
