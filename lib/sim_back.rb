require 'sidekiq'
require 'mharris_ext'
require 'mongoid'
require 'andand'
require 'mongoid_gem_config'

class Object
  def klass
    self.class
  end
end

module SimBack
  class << self
    def root
      File.expand_path(File.dirname(__FILE__) + "/..")
    end
    def load!
      %w(queue sim sim_progress sims summary_worker worker util consolidate_worker).each do |f|
        load File.dirname(__FILE__) + "/sim_back/#{f}.rb"
      end

      %w(web).each do |f|
        load File.dirname(__FILE__) + "/sim_back/web/#{f}.rb"
      end
    end
  end
end

MongoidGemConfig.register_gems SimBack

SimBack.load!

