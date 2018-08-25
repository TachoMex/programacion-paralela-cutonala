def thread_controller(timer)
  counter = 0
  loop do
    puts "Hello from thread: #{Thread.current.object_id}. #{counter}"
    counter += 1
    sleep(timer)
  end
end

Thread.new { thread_controller(1) }
t1 = Thread.new { thread_controller(2) }
t1.join
