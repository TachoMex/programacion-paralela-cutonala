l = [1, 3, 4, 5, 6, 7]

def print_list(l)
  l.each { |e| puts e }
end

print_list(l)

h = l.map { |e| e**0.5 }

print_list(h)
