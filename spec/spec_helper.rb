ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

if ENV.fetch("COVERAGE", false)
  require "simplecov"
  SimpleCov.start "rails"
end

require "webmock/rspec"
require 'capybara/rspec'

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.include Rails.application.routes.url_helpers, type: :feature

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = "tmp/rspec_examples.txt"
  config.order = :random
end

WebMock.disable_net_connect!(allow_localhost: true)
