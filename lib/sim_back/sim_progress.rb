module SimBack
  class SimProgress
    include Mongoid::Document
    include Mongoid::Timestamps

    def self.find_one_object(id)
      find(id)
    rescue => exp
      raise "can't find #{id}"
    end

    def completed_sims
      sims_completed
    end

    def run_state
      res = if num_sims == completed_sims
        :complete
      elsif num_sims > completed_sims
        :running
      else
        :error
      end
      #puts "Run State: #{res} num_sims: #{num_sims} completed: #{completed_sims} results: #{season_results.count}"
      res
    end
  end
end