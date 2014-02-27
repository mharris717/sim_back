module SimBack
  module SummaryMod
    def reschedule(*args)
      klass.perform_in(2.seconds,*args)
    end
  end

  class SummaryWorker
    include Sidekiq::Worker
    include SummaryMod

    def perform(sim_progress_id)
      progress = SimProgress.find_one_object(sim_progress_id)
      state = progress.run_state
      #puts "State: #{state}"
      if state == :complete
        make_summary(progress)
      elsif state == :error
        # something
      elsif state == :running
        reschedule(progress.id.to_s)
      else
        raise "unknown state #{state} for #{progress.season_start.id}"
      end
    end

    def make_summary(progress)
      raise NotImplementedError
    end

    
  end

  class IntermediateSummaryWorker
    include Sidekiq::Worker
    include SummaryMod
    sidekiq_options :queue => :critical

    def perform(sim_progress_id,target_sims)
      progress = SimProgress.find_one_object(sim_progress_id)
      state = progress.run_state
      if state == :running
        if progress.sims_completed >= target_sims
          make_summary(progress)
          reschedule(sim_progress_id,target_sims+progress.intermediate_summary_multiple)
        else
          reschedule(sim_progress_id,target_sims)
        end
      end
    end

    def make_summary(*args)
      ops = [klass,args.first.run_state,args.first.num_sims,args.first.sims_completed]
      ops << args.last if args.size > 1
      klass.log_make_summary(ops)
      SummaryWorker.new.make_summary(*args)
    end

    class << self
      fattr(:make_summary_args) { [] }
      def log_make_summary(*args)
        self.make_summary_args << args
      end
    end
  end

end