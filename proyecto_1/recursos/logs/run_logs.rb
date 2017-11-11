require 'cute_logger'

CuteLogger.setup(severity: 'DEBUG')

log_info('Some tests')
log_warn('Some logs', user: 'some user')
begin
  fail('A very bad thing')
rescue => ex
  log_fatal('Something crashed', error: ex)
end


class HelloWorld
  def initialize
    log_debug('Creating a new object')
  end

  def run
    log_info('HelloWorld')
  end
end

HelloWorld.new.run
