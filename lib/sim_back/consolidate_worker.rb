module SimBack
  class ConsolidateWorker
    include Sidekiq::Worker

    def perform(sim_progress_id)
      progress = SimProgress.find_one_object(sim_progress_id)
      state = progress.run_state
      #puts "State: #{state}"
      if state == :complete
        consolidate(progress)
      elsif state == :error
        # something
      elsif state == :running
        consolidate(progress)
        reschedule(progress.id.to_s)
      else
        raise "unknown state #{state} for #{progress.season_start.id}"
      end
    end

    def consolidate_once(progress)
      false
    end

    def consolidate(progress)
      loop do
        return unless consolidate_once(progress)
      end
    end

    def reschedule(*args)
      klass.perform_in(2.seconds,*args)
    end

    
  end
end