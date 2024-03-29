source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'bcrypt', '~> 3.1.7'
gem 'droplet_kit'
gem 'friendly_id', '~> 5.4.0'
gem 'jbuilder', '~> 2.6'
gem 'jwt'
gem 'pg_search'
gem 'rack-cors'
gem 'spicy-proton'
gem 'sprockets'
gem 'sassc-rails'
gem 'googleauth'
gem 'active_storage_validations', '~> 1.0', '>= 1.0.3'
gem 'aws-sdk-s3'
gem 'premailer-rails', '~> 1.9', '>= 1.9.2'
gem 'noticed'
gem 'kaminari'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'annotate'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

gem 'capistrano'
gem 'capistrano3-puma'
gem 'capistrano-bundler', require: false
gem 'capistrano-rails', require: false
gem 'capistrano-rvm'

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'byebug'
  gem "letter_opener"
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
end

gem "sidekiq", "~> 7.0"
