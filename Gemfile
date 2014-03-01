source 'https://rubygems.org'
ruby '2.1.0'

# Rails.
gem 'rails', '4.0.2'
gem 'turbolinks'
gem 'rails_12factor'

# Database.
gem 'pg'

# Web server.
gem 'unicorn'
gem 'foreman'

# Assets.
gem 'bootstrap-sass', '~> 3.0.3.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

gem 'faraday'

group :development do
  gem 'rspec-rails'
end

# Test dependencies.
group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'dotenv-rails'
  gem 'pry'
  gem 'pry-rails'
end

group :production do
  # Monitoring.
  gem 'newrelic_rpm'

  # Bug monitoring.
  # gem 'bugsnag'
end
