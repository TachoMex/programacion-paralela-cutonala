require_relative 'main'

run Rack::Cascade.new [AuthServer.new]
