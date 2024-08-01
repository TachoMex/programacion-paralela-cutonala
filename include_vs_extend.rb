module A
  def say_hello
    puts "hello!"
  end
end

class B
  puts "lol"
  include A
end

class C
  extend A
end

B.new.say_hello
C.say_hello

x = {}
x.extend(A)
x.say_hello
