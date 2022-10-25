def method_1
  num_1 = 1
end

def method_2
  num_2 = method_1 + 1
end

num_3 = method_1 + 2

loop do
  num_4 = num_3 + 1
  num_5 = method_2 + num_3
  puts num_5
  break
end