require_relative 'example_api'
run Rack::Cascade.new [ExampleAPI]
