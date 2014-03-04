module SimBack
  class Sim
    def run!
      base = sim_progress.base_number
      #sim_progress.inc(:sum_number => base)
      NumberObj.create! :number => base, :sim_progress_id => sim_progress.id.to_s
    end
  end
  class SummaryWorker
    def make_summary(progress)
      File.create "tmp/sum.txt",NumberObj.summed(progress)+10.0
    end
  end
  class IntermediateSummaryWorker
    def make_summary(*args)
      ops = [klass,args.first.run_state,args.first.num_sims,args.first.sims_completed]
      ops << args.last if args.size > 1
      klass.log_make_summary(ops)
      File.create "tmp/sum.txt",NumberObj.summed(args.first)
    end
  end

  class NumberObj
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    store_in session: :sim_back
    field :number, type: Float

    class << self
      def summed(progress)
        nums = where(sim_progress_id: progress.id.to_s)
        nums.map { |x| x.number }.sum
      end
    end
  end

  class ConsolidateWorker
    def consolidate_once(progress)
      c = SimBack::NumberObj.where(:sim_progress_id => progress.id.to_s).count
      if c >= 25
        nums = SimBack::NumberObj.where(:sim_progress_id => progress.id.to_s).limit(25)
        SimBack::NumberObj.create!(:sim_progress_id => progress.id.to_s, :number => nums.map { |x| x.number }.sum)
        nums.each { |x| x.destroy }
        #puts "#{c} -> #{SimBack::NumberObj.where(:sim_progress_id => progress.id.to_s).count}"
        true
      else
        false
      end
    end
  end
end