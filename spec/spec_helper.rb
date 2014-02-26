require 'rubygems'
require 'spork'
require 'mharris_ext'

Spork.prefork do
  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.start
  end

  #require 'rspec-prof'
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
  $LOAD_PATH.unshift(File.dirname(__FILE__))

  require 'rspec'

  # Requires supporting files with custom matchers and macros, etc,
  # in ./support/ and its subdirectories.
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

  RSpec.configure do |config|
    config.fail_fast = true
  end
end

Spork.each_run do
  if ENV['DRB']
    require 'simplecov'
    SimpleCov.start
  end
  load File.dirname(__FILE__) + "/../lib/sim_back.rb"
  SimBack.setup_mongoid!
  Dir["#{File.dirname(__FILE__)}/support_ext/**/*.rb"].each { |f| load f }
end
