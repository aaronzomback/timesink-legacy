source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'

# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3', '~> 1.4'
end

# for live site deployment
group :production do
  gem 'pg'
end


gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'


# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4.3'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'simple_form'
gem 'jquery-ui-rails'
gem 'form_slider'

# user login, secure password
gem 'bcrypt'

# for admin
gem 'activeadmin'
gem 'devise'

# for film page views count
gem 'impressionist',
  git: 'https://github.com/aaronzomback/imp.git',
   ref: '46a582ff8cd3496da64f174b30b91f9d97e86643'
gem "punching_bag"

# store file upload avatar in sessions
gem 'activerecord-session_store'

# for image uploads
gem 'carrierwave', '~> 2.0'
gem 'mini_magick'
gem 'fog-aws'

gem 'rails_autolink', '~> 1.1', '>= 1.1.6'

gem 'tinymce-rails'
gem 'activeadmin_quill_editor'
gem 'activeadmin_trumbowyg'

#accept payments
gem 'stripe'
gem 'dotenv'
gem 'json'
gem 'sinatra'

# features
gem 'acts_as_votable', '~> 0.12.1'
gem 'notifications'

gem 'jquery-rails'
gem 'vanilla-ujs'

gem 'video-js-rails', '~> 4.3', '>= 4.3.0.1'


gem 'rails_refactor'
gem 'friendly_id', '~> 5.4.0'
gem 'stringex', '~> 2.8', '>= 2.8.5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
