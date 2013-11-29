#-*-ruby-*-
source 'https://rubygems.org'
ruby '2.0.0'

gem 'jquery-rails'
gem 'rails', '~> 3.2.15'
gem 'will_paginate'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end

group :development, :test do
  gem 'annotate',	require: false
  gem 'debugger'
  gem 'heroku',		require: false
  gem 'mysql2'
  gem 'sqlite3'
  gem 'taps',		require: false

  # Deploy with Capistrano
  # gem 'capistrano'
end
