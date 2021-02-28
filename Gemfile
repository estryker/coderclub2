source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# Not getting webpacker to work even loading jquery, and certainly not opal. reverting to sprockets
# https://stackoverflow.com/questions/55213868/rails-6-how-to-disable-webpack-and-use-sprockets-instead#58518795
# gem 'webpacker', '~> 5.0'
gem 'sprockets'
gem 'sprockets-rails', :require => 'sprockets/railtie'

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
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# gem 'bootstrap'

gem 'jquery-rails'
gem 'jquery-ui-rails'
# copying stuff in from github project into app/assets
# I am using include tags instead of sprockets for codemirror and bootstrap at the moment. 
# gem 'codemirror-rails'
# Not sure why this depends on rails < 6.1 ...
gem 'opal-rails', '>= 1.1.0'
gem 'opal-jquery'
gem 'opal-browser'

# for rendering markdown partials. High voltage does the static pages, markdown-rails does the markdown conversion
# Note, you will need config/initializers/high_voltage.rb and a file called: app/views/layouts/blank_layout.html.erb
# Without markdown-rails, the static .md files won't be rendered.  
gem 'high_voltage', '~>3.1'
gem 'markdown-rails'

