module SimBack
  class Queue
    class << self
      def each_chunk_size(num_sims)
        while num_sims > 0
          raise "bad" if num_sims < 0
          chunk = [max_chunk_size,num_sims].min
          yield(chunk)
          num_sims -= chunk
        end
      end

      def max_chunk_size
        25
      end
      def queue(num_sims, sim_progress_ops)
        default = {:num_sims => num_sims, :sims_completed => 0}
        sim_progress_ops = sim_progress_ops.merge(default)

        progress = SimProgress.new(sim_progress_ops)
        progress.save!

        each_chunk_size(num_sims) do |chunk_size|
          Worker.perform_async(progress.id.to_s,chunk_size)
        end

        SummaryWorker.perform_async(progress.id.to_s)
        IntermediateSummaryWorker.perform_async(progress.id.to_s,progress.intermediate_summary_multiple)
        ConsolidateWorker.perform_async(progress.id.to_s)
        
        progress
      end
    end
  end
end