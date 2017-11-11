require_relative 'token_ap'

run Rack::Cascade.new [TokenAPP]
