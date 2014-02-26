require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "SimBack" do
  it "smoke" do
    2.should == 2
  end

  it 'smoke - fake', sidekiq: :inline do
    i = rand().round(3)
    SimBack::Queue.queue(100, :base_number => i)
    sum = File.read("tmp/sum.txt").to_f.round(3)
    sum.should == (i*100.0).round(3)
  end

  after do
    SimBack.delete_all!
  end
end
