module SimBack
  class SummaryWorker
    include Sidekiq::Worker

    def perform(sim_progress_id)
      progress = SimProgress.find_one_object(sim_progress_id)
      state = progress.run_state
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
      File.create "tmp/sum.txt",progress.sum_number
    end

    def reschedule(sim_progress_id)
      klass.perform_in(2.seconds,sim_progress_id)
    end
  end
end