class FakeRunner
  include FromHash
  fattr(:worker_classes) { [] }
  def to_s
    res = {}
    worker_classes.each do |cls|
      res[cls] = cls.jobs.size
    end
    res.inspect
  end
  def jobs?
    worker_classes.any? { |x| x.jobs.size > 0 }
  end
  def run_once!
    worker_classes.each do |cls|
      if cls.jobs.size > 0
        #puts "running job for #{cls}"
        cls.perform_one
      end
    end
  end
  def run!
    while jobs?
      run_once!
    end 
  end
end

shared_context "runner" do
  let(:runner) do
    FakeRunner.new(:worker_classes => [SimBack::Worker,SimBack::SummaryWorker,SimBack::IntermediateSummaryWorker])
  end
end