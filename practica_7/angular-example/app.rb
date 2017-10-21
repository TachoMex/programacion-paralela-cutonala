require 'sinatra'

class AngularExample < Sinatra::Base
  configure do
    set :public_folder, 'public'
  end

  get '/' do
    File.read('./public/index.html')
  end
end
