source 'https://rubygems.org'
ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.21'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  # gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# group :test do
#   gem 'sqlite3'
# end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data'
gem 'rails-i18n'
gem 'dalli'

gem 'devise'
gem 'devise-i18n'
gem 'devise-bootstrapped'
gem 'cancancan'
gem 'ransack'
gem 'friendly_id'
gem 'exception_notification'
gem "jquery-fileupload-rails", '0.4.1'

# gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'font-awesome-rails'
gem 'ionicons-rails'
# gem 'bootstrap-wysihtml5-rails'

gem 'dragonfly'
gem 'simple_form'
gem 'kaminari'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap', '~> 3.3.7'
  gem 'rails-assets-datatables'
  gem 'rails-assets-jquery'
  gem 'rails-assets-jquery-ui'
  gem 'rails-assets-jquery-knob'
  gem 'rails-assets-moment'
  gem 'rails-assets-bootstrap-daterangepicker'
  gem 'rails-assets-select2'
  gem 'rails-assets-highcharts'
  gem 'rails-assets-autosize'
  gem 'rails-assets-bxSlider'
end

gem 'capistrano-rails'
gem 'capistrano-rbenv'
gem 'capistrano3-puma'
gem 'whenever', require: false

gem 'bootsnap', require: false

gem 'faker'
gem 'sucker_punch'

gem 'paranoia'
gem 'cocoon'
gem "roo"
gem 'activerecord-import'
gem 'chartkick'
gem 'groupdate'

# gem "highcharts-rails"

gem 'draper'
# gem 'roadie-rails'
gem 'acts_as_list'
