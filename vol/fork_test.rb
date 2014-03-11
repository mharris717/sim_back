require 'mharris_ext'

class CaptureOut
  include FromHash
  attr_accessor :base

  fattr(:filename) do
    i = rand(10000000000000000)
    "/code/orig/sim_back/tmp/#{i}_out.txt"
  end

  fattr(:file) do
    File.new(filename,"w")
  end

  def write(str)
    raise 'foo'
    base.write "WRITE CALL #{str}"
    base.write(str)
    File.append filename, str
  end

  def replace_stdout!
    self.base = $stdout
    $stdout = self
  end

  def replace_stderr!
    self.base = $stderr
    $stderr = self
  end

  def read_from_file
    File.read(filename)
  end

  class << self
    def make(ops={})
      res = new(ops)
      res.filename
      res
    end
  end
end

def stuff1
  capture_out = CaptureOut.make
  capture_err = CaptureOut.make

  pid = fork do
    capture_out.replace_stdout!
    capture_err.replace_stderr!

    exec "bundle exec rake spec"
  end

  Process.wait pid

  str = capture_out.read_from_file
  puts "STR:\n#{str}"
end

def stuff
  require 'mharris_ext'
  res = ec("bundle exec rake spec", fork: true)
  puts "RES:\n#{res}"
end

stuff1