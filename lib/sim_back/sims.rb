module SimBack
  class Sims
    include FromHash
    attr_accessor :sim_progress_id, :num_sims
    fattr(:sim_progress) do
      SimProgress.find_one_object(sim_progress_id) 
    end

    def run!
      num_sims.times do
        Sim.new(:sim_progress => sim_progress).run!
      end

      sim_progress.inc(:sims_completed,num_sims)
    end
  end
end