arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

evens = arr.map do |subarray|
  subarray.select do |int|
    int % 3 == 0
  end
end

p evens.inspect