require './daemon'
require './kafka_client'

class ConsumerDaemon
  WAIT_MAX = 1

  include Services
  def initialize
    @kafka = kafka_client
    @daemon = Daemon.new(0.5, true, self)
  end

  def exec
    message = @kafka.read_message
    movie = JSON.parse(message, symbolize_names: true)
    log_info('Serving ticket for movie', movie: movie)
  end

  def run
    @daemon.run
  end
end

ConsumerDaemon.new.run
