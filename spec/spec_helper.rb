ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include ApplicationHelper
  config.include RequestsHelper
  config.include Rails.application.routes.url_helpers
  config.include FactoryGirl::Syntax::Methods
end
