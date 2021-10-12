source 'http://rubygems.org'
#source 'http://gems.github.com'


# Bundle edge Rails instead:
gem 'rails'
gem 'railties'
gem 'concurrent-ruby'

gem 'bundler'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'pg', '~> 0.21.0'
# Use Puma as the app server

gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
#gem 'kaminari'

gem 'simple_form'
gem 'ffi', '1.9.18'
gem 'activeadmin', :git => 'https://github.com/gregbell/active_admin.git'
gem 'active_admin_theme'
#gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'mini_magick'
gem "google-cloud-storage",  require: false
gem "active_admin-sortable_tree"
#gem 'active_admin_importable'
gem 'active_admin_import'#, :git => 'https://github.com/activeadmin-plugins/active_admin_import"
gem 'activeadmin_addons'
gem 'active_admin_datetimepicker'
gem 'active_admin_role'
#gem 'activeadmin-index_as_calendar', github: 'bys-control/activeadmin-index_as_calendar'
gem 'active_admin-duplicatable'
gem 'select2-rails'
gem 'activeadmin-select2', :git => 'https://github.com/mfairburn/activeadmin-select2'
gem 'responders', '~> 2.2'
#gem 'gmaps4rails'
gem 'underscore-rails'
#gem 'geocoder'
#gem 'google-api-client',  require: 'google/apis/calendar_v3'

gem 'omniauth'
gem 'omniauth-google-oauth2', git: 'https://github.com/zquestz/omniauth-google-oauth2.git'
gem 'omniauth-oauth2'
gem 'activerecord-session_store'
gem 'figaro'
gem 'high_voltage', '~> 3.0.0'
# Use jquery as the JavaScript library
gem 'rails-assets-jquery', source: 'https://rails-assets.org'
gem 'rails-assets-datatables', source: 'https://rails-assets.org'
gem 'rails-assets-jquery-ujs'
#gem 'jquery-ui-rails'
#gem 'jquery-rails'
#gem 'bootstrap-datepicker-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
gem 'activemodel'
gem 'activerecord'
gem 'actionpack'
gem "activesupport"
gem 'bcrypt', '~> 3.1.7'
gem 'font-awesome-sass'
gem 'bootstrap-sass'
gem 'simple_form'
gem 'devise'
gem 'cancancan'
gem 'd3-rails'
gem 'will_paginate-bootstrap', '~> 1.0.1'
gem 'cocoon'
gem 'rails_layout'
gem 'ransack', :git => 'https://github.com/activerecord-hackery/ransack'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
end

group :development do
  # Use Dotenv for environment variables
  gem 'dotenv'
  gem "better_errors"
  gem "binding_of_caller"
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'

  gem 'guard', '~>2.14.0'
  gem 'guard-rspec', '~> 4.7.2'
  gem 'guard-cucumber', '~> 2.1.2'
  gem 'bootsnap', require: false
end

group :production do
  # Use Capistrano for deployment

  #gem 'pg', '0.21.0'
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-rails', group: :development
end

group :test do
  gem 'capybara'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
