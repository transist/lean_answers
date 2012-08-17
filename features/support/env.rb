ENV['RAILS_ENV'] = 'test'
require './config/environment'
require 'rspec'
require 'spinach/capybara'

Capybara.javascript_driver = :webkit

Spinach::FeatureSteps.class_eval do
  include FactoryGirl::Syntax::Methods
end

Spinach.hooks.around_scenario do |scenario_data, step_definitions, &block|

  if scenario_data.tags.include?('javascript')
    DatabaseCleaner.strategy = :truncation
  else
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  block.call

  DatabaseCleaner.clean
end

Spinach.config.save_and_open_page_on_failure = true
