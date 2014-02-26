module SimBack
  class Sim
    include FromHash
    attr_accessor :sim_progress, :sims

    def run!
      base = sim_progress.base_number
      sim_progress.inc(:sum_number, base)
    end
  end
end