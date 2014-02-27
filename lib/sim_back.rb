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
      f = File.dirname(__FILE__) + "/../config/development.yml"
      Mongoid.load!(f, :development)
    end
  end
end

%w(queue sim sim_progress sims summary_worker worker util).each do |f|
  load File.dirname(__FILE__) + "/sim_back/#{f}.rb"
end