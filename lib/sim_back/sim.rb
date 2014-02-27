module SimBack
  class Sim
    include FromHash
    attr_accessor :sim_progress, :sims

    def run!
      raise NotImplementedError
    end
  end
end