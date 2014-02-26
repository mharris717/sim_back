module SimBack
  class << self
    fattr(:redis_url) { 'redis://localhost:6379' }
    def setup!
      Sidekiq.configure_client do |config|
        config.redis = { :namespace => 'simback_div', :size => 1, :url => redis_url }
      end

      # Sidekiq server is multi-threaded so our Redis connection pool size defaults to concurrency (-c)
      Sidekiq.configure_server do |config|
        config.redis = { :namespace => 'simback_div', :url => redis_url }
      end
    end
  end

  # Start up sidekiq via
  # ./bin/sidekiq -r ./examples/por.rb
  # and then you can open up an IRB session like so:
  # irb -r ./examples/por.rb
  # where you can then say
  # PlainOldRuby.perform_async "like a dog", 3
  #

  class Worker
    include Sidekiq::Worker

    def perform(sim_progress_id,num_sims)
      Sims.new(:sim_progress_id => sim_progress_id, :num_sims => num_sims).run!
    end
  end
end