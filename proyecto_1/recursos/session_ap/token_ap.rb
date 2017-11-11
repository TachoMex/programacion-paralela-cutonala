require 'grape'
require 'jwt'
require 'cute_logger'

module Services
  def self.pub_key
    priv_key.public_key
  end

  def self.priv_key
    @priv ||= OpenSSL::PKey::RSA.generate 2048
  end
end

module TokenHelper
  def session_token
    token = params[:token]
    JWT.decode(token, Services.pub_key, true, algorithm: 'RS512')
  end
end

class TokenAPP < Grape::API
  format(:json)
  helpers TokenHelper

  get :auth do
    data = {
      user: params[:user],
      something: 'one string'
    }
    token = JWT.encode(data, Services.priv_key, 'RS512')
    { token: token }
  end

  get do
    log_info('User active', token: session_token)
    { hello: session_token[0]['user'] }
  end
end
