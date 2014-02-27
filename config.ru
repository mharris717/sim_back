load File.dirname(__FILE__) + "/lib/sim_back.rb"
SimBack.setup!
SimBack.setup_mongoid!

run SimBack::Web