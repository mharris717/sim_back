require 'sinatra/base'
require 'haml'
require 'tilt'

module SimBack
  class Web < Sinatra::Base
    set :root, File.expand_path(File.dirname(__FILE__))
    get "/" do
      haml :index
    end
  end
end