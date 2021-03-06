source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'rails-api'

gem 'active_model_serializers', '0.9.3'
gem 'cancan'
gem 'carrierwave', git: 'https://github.com/carrierwaveuploader/carrierwave.git'
gem 'coffee-rails', '~> 4.0.0'
gem 'rack-cors', require: 'rack/cors'
gem 'devise'
gem 'dotenv-rails'
gem 'goodreads'
gem 'mini_magick'
gem 'newrelic_rpm'
gem 'paranoia', '~> 2.0'
gem 'puma'
gem 'rvm-capistrano'
gem 'uglifier', '>= 1.3.0'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'sqlite3'
end

group :development do
  gem 'better_errors'
  gem 'capistrano',         '~> 3.0.1'
  gem 'capistrano-bundler', '~> 1.1.0'
  gem 'capistrano-rails',   '~> 1.1.0'
  gem 'capistrano-rvm',     '~> 0.1.0'
  gem 'capistrano3-puma'
  gem 'quiet_assets'
  gem 'rubocop', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.2'
  gem 'nokogiri'
  gem 'timecop'
  gem 'webmock'
end

group :doc do
  gem 'sdoc', require: false
end
