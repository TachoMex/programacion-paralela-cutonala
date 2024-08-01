def print_array(arr)
  arr.each do |elem|
    puts elem
  end
end

def dividers(num)
  i = 1
  result = []

  while i <= num
    result << i if (num % i).zero?
    i += 1
  end
  result
end

class Integer
  def prime?
    dividers(self).size == 2
  end
end

def primos(num)
  (1..num).select(&:prime?)
  # resultado = []
  # i = 1
  # while i <= num
  #   resultado << i if prime?(i)
  #   i += 1
  # end
  # resultado
end

def ascii(arr)
  # arr.chars.map { |c| c.ord }
  arr.chars.map(&:ord)
  # array = []
  # arr.chars.each do |c|
  #   array << c.ord
  # end
  # array
end

def order(arre)
  arre.sort_by(&:size)
end

print_array(%w[hola mundo alumnos cutonala])
print_array(['hello', 5, :chilaquil, 3.141592])
print_array([1, 2, 3, 4, 5])
print_array((1..10))
print_array(dividers(1024))

print_array(primos(20))
print_array(ascii('Cristina'))
print_array(order(%w[hola mundo a]))
