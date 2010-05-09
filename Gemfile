source 'http://rubygems.org'
gem 'rails', '3.0.0.beta3'
gem "rspec-rails", ">= 2.0.0.beta.7"
gem 'sinatra'
gem "chronic"
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'mysql'
#gem 'RedCloth'
gem 'compass', '0.10.0.rc4'
gem "compass-colors"
gem "haml" #, #"3.0.0.beta.1"
gem "fancy-buttons"
#gem "paperclip", :git => "git://github.com/JasonKing/paperclip.git", :branch => "rails3"
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem "authlogic", :git => "git://github.com/odorcicd/authlogic.git", :branch => "rails3"
gem "will_paginate", :git => "git://github.com/mislav/will_paginate.git", :branch => "rails3"
gem "cancan"
#gem 'acts-as-taggable-on'
gem "acts-as-taggable-on", :git => "git://github.com/seivan/acts-as-taggable-on.git", :branch => "rails3"
gem 'RedCloth'
gem 'formtastic', :git => "git://github.com/justinfrench/formtastic.git", :branch => "rails3"
#gem 'validation_reflection'
#gem install formtastic-rails3
#gem 'formtastic', :git => "git://github.com/sobrinho/formtastic.git", :branch => "rails3"


group :deploy do
  gem 'unicorn'
  gem 'capistrano'
end

group :development do
  gem 'ruby-debug19'
  #gem 'annotate', :git => "git://github.com/bendyworks/annotate_models.git"
end
 
 group :test, :cucumber do
    gem "cucumber-rails"
    gem 'webrat'
    gem 'faker'
    #require 'faker'
    gem 'machinist'
    #require 'machinist/active_record'
    #require 'sham'
   gem 'database_cleaner'
 end
