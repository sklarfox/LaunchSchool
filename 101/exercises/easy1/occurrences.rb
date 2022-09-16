def count_occurrences(array)
  words = Hash.new
  array.each do |x|
    unless words.has_key?(x) # If hash doesn't contain the key, initialize key and set to 1
      words[x] = 1
    else  # Otherwise increment value by 1
      words[x] += 1
    end
  end
  words.each_pair {|key, value| puts "#{key} => #{value}"}
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)