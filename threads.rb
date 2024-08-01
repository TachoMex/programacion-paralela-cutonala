require "thread"

def thread_controller(timer, lock)
  counter = 0
  loop do
      puts "Hello from thread: #{Thread.current.object_id}. #{counter}"
      lock.synchronize do
        counter += 1
        sleep(timer)
      end
  end
end

lock = Mutex.new

Thread.new { thread_controller(1, lock) }
t1 = Thread.new { thread_controller(2, lock) }
t1 = Thread.new { thread_controller(1, lock) }

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
