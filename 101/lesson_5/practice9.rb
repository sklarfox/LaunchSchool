arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr_sorted = arr.map do |element|
  element.sort { |a, b| b <=> a }
end

puts arr_sorted.inspect