source "http://rubygems.org"
# Add dependencies required to use your gem here.
# Example:
#   gem "activesupport", ">= 2.3.5"

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.

#### SPECIAL GEMFILE BLOCK START
def private_gem(name)
  gem name, '0.3.0', git: "https://#{ENV['GITHUB_TOKEN']}:x-oauth-basic@github.com/mharris717/#{name}.git", branch: :master
end
#### SPECIAL GEMFILE BLOCK END

group :development do
  gem "rspec", "~> 2.8.0"
  gem "rdoc", "~> 3.12"
  gem "bundler", ">= 1.0.0"
  gem "jeweler", "~> 1.8.4"

  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'

  gem 'rb-fsevent', '~> 0.9'

  gem 'lre'
  gem 'rake'
end

group :test do
  gem 'simplecov', require: false
end

gem 'mharris_ext'
gem 'andand'

#gem 'activesupport','3.2.2'
gem 'mongoid', github: "mongoid/mongoid"
gem 'bson_ext'
#gem 'mongo'
#gem 'mongo_persist'
#gem 'hpricot'
#gem 'nokogiri'
#gem 'repl_index'

gem 'sidekiq',"2.17.1"
gem 'sinatra'
gem 'slim'
gem 'haml'
gem 'tilt', '~> 1.4.1'

private_gem 'mongoid_gem_config'

