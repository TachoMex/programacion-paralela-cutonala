class Daemon
  def initialize(wait_time, attach, proc)
    @proc = proc
    @wait_time = wait_time
    @attach = attach
    @finish = false
  end

  def task
    loop do
      begin
        @proc.exec
      rescue => ex
        log_error('Unexpected error', error: ex)
      end
      sleep(@wait_time)
    end
  end

  def run
    if @attach
      task
    else
      Thread.new(&:task)
    end
  end
end
