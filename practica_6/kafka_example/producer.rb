require './daemon'
require './kafka_client'

class ProducerDaemon
  WAIT_MAX = 10
  MOVIES = ['Saturday Night Fever', 'Blade Runner', '2001: A Space Odyssey'].freeze
  SCHEDULES = [Time.now, Time.now - 60 * 60, Time.now - 120 * 60].freeze
  ROOM = ['R-10', 'R-25', 'R-3'].freeze

  include Services
  def initialize
    @kafka = kafka_client
    @daemon = Daemon.new(1, true, self)
  end

  def run
    @daemon.run
  end

  def generate_movie
    {
      movie: MOVIES.sample,
      schedule: SCHEDULES.sample,
      room: ROOM.sample
    }
  end

  def exec
    movie = generate_movie
    log_info('Requesting a ticket for movie', movie: movie)
    @kafka.deliver_message(movie.to_json)
    sleep(0.1)
  end
end

ProducerDaemon.new.run
