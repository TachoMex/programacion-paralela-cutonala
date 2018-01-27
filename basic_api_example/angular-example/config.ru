require_relative 'app'
require_relative 'api'

run Rack::Cascade.new [AngularExample, TODOList::API]
