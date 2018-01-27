require 'grape'
require 'ant'

require_relative 'lib/services'
require_relative 'lib/dependency_injector'

require_relative 'routes/todo_list'

Services.configure!

module TODOList
  Controller::Task.register(:db, Services.database[:task])

  class API < Grape::API
    version('v1', using: :header, vendor: :cut)
    prefix(:api)
    format(:json)
    helpers Ant::Response

    mount Routes::TODOList
  end
end
