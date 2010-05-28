source 'http://rubygems.org'
gem 'rails', '3.0.0.beta3'
#gem 'sinatra'
gem 'mysql'
gem 'RedCloth'
gem 'compass'
gem "compass-colors"
gem "haml"
gem "fancy-buttons"

gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem "authlogic", :git => "git://github.com/odorcicd/authlogic.git", :branch => "rails3"
gem "will_paginate", :git => "git://github.com/mislav/will_paginate.git", :branch => "rails3"
gem "cancan"

gem "acts-as-taggable-on"
gem 'RedCloth'
gem 'formtastic', :git => "git://github.com/justinfrench/formtastic.git", :branch => "rails3"
#gem 'daemons'
#gem 'validation_reflection'
#gem install formtastic-rails3
#gem 'formtastic', :git => "git://github.com/sobrinho/formtastic.git", :branch => "rails3"
#gem "paperclip", :git => "git://github.com/JasonKing/paperclip.git", :branch => "rails3"
#gem "chronic"
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
#gem 'acts-as-taggable-on'


group :deploy do
  gem 'unicorn'
  gem 'capistrano'
end

group :development do
  #gem 'ruby-debug19'
end
  
group :test, :cucumber do
    gem "rspec-rails", ">= 2.0.0.beta.9"
    gem "cucumber-rails"
    gem "capybara"
    gem 'faker'
    gem 'machinist'
    gem 'database_cleaner'
    gem "autotest"
    gem "autotest-rails"
end
