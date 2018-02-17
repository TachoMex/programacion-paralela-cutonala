require_relative 'lib/services'
require_relative 'controllers/auth'
require_relative 'routes/auth'

require 'grape'
require 'json'
require 'ant'

class AuthServer < Grape::API
  version 'v1', using: :header, vendor: 'UdeG'
  format :json
  prefix :api

  helpers Ant::Response

  mount Routes::Auth
end
