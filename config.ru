load File.dirname(__FILE__) + "/lib/sim_back.rb"
SimBack.setup!

require 'sidekiq/web'
run Sidekiq::Web