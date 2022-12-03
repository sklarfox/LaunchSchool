numbers = [1, 2]
letters = ['a','b']
symbols = ['+', '-']

nested_array = numbers.product(letters).product(symbols).flatten #.map(&:flatten)

hash = { 'key1' => ['value1a', 'value1b']}

# print nested_array

# nested_array.each do |one, two, three| 
#   puts "#{one} #{two} #{three}"
# end

hash.each do |key, value1, value2|
  puts "The key is #{key}, the first value is #{value1}, the second value is #{value2}"
end