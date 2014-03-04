require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "SimBack" do
  include_context "runner"
  it "smoke" do
    2.should == 2
  end

  it 'smoke - fake', sidekiq: :inline do
    i = rand().round(3)
    SimBack::Queue.queue(100, :base_number => i)
    sum = File.read("tmp/sum.txt").to_f.round(3)
    sum.should == (i*100.0 + 10.0).round(3)
  end

  it 'consolidate', sidekiq: :fake do
    progress = SimBack::Queue.queue(100, :base_number => 2)
    runner.run!
    SimBack::NumberObj.where(:sim_progress_id => progress.id.to_s).count.should == 4
  end

  before do
    SimBack::IntermediateSummaryWorker.make_summary_args = []
  end

  it 'calls make_summary once', sidekiq: :fake do
    SimBack::Queue.queue(150, :base_number => 2, :intermediate_summary_multiple => 50)
    runner.run!
    SimBack::IntermediateSummaryWorker.make_summary_args.size.should == 2
  end

  it 'calls make_summary once', sidekiq: :fake do
    i = rand().round(3)
    SimBack::Queue.queue(150, :base_number => i, :intermediate_summary_multiple => 50)
    2.times { runner.run_once! }
    SimBack::IntermediateSummaryWorker.make_summary_args.size.should == 1
    sum = File.read("tmp/sum.txt").to_f.round(3)
    sum.should == (i*50.0).round(3)
  end

  after do
    SimBack.delete_all!
  end
end
