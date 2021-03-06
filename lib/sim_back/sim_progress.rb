module SimBack
  class SimProgress
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Attributes::Dynamic
    store_in session: :sim_back

    field :intermediate_summary_multiple, type: Integer
    before_save do |prog|
      prog.intermediate_summary_multiple ||= 1000
    end

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
      #puts "Run State: #{res} num_sims: #{num_sims} completed: #{completed_sims}"
      res
    end
  end
end