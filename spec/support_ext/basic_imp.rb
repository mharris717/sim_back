module SimBack
  class Sim
    def run!
      base = sim_progress.base_number
      sim_progress.inc(:sum_number => base)
    end
  end
  class SummaryWorker
    def make_summary(progress)
      File.create "tmp/sum.txt",progress.sum_number+10.0
    end
  end
  class IntermediateSummaryWorker
    def make_summary(*args)
      ops = [klass,args.first.run_state,args.first.num_sims,args.first.sims_completed]
      ops << args.last if args.size > 1
      klass.log_make_summary(ops)
      File.create "tmp/sum.txt",args.first.sum_number
    end
  end
end