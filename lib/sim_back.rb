require 'sidekiq'
require 'mharris_ext'
require 'mongoid'
require 'andand'

class Object
  def klass
    self.class
  end
end

module SimBack
  class << self
    def setup_mongoid!
      f = File.dirname(__FILE__) + "/../config/mongoid.yml"
      Mongoid.load!(f, :development)
    end

    def root
      File.expand_path(File.dirname(__FILE__) + "/..")
    end
  end
end

%w(queue sim sim_progress sims summary_worker worker util consolidate_worker).each do |f|
  load File.dirname(__FILE__) + "/sim_back/#{f}.rb"
end

%w(web).each do |f|
  load File.dirname(__FILE__) + "/sim_back/web/#{f}.rb"
end