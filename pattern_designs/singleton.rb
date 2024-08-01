class SingletonExample
  class << self
    def mutex
      @mutex ||= Mutex.new
    end

    def print(msg)
      @mutex.synchronize do
        puts msg
      end
    end
  end
end

def thread_controller(timer)
  counter = 0
  loop do
    puts "Hello from thread: #{Thread.current.object_id}. #{counter}"
    SingletonExample.mutex.synchronize do
      counter += 1
      sleep(timer)
    end
  end
end

Thread.new { thread_controller(1) }
t1 = Thread.new { thread_controller(2) }
t1 = Thread.new { thread_controller(1) }

lock = SingletonExample.mutex

loop do
  puts lock.owned? ? "Release?" : "Take?"
  gets
  if lock.owned?
    lock.unlock
  else
    lock.lock
  end
end
# Tutorial.new(lock).show
t1.join
