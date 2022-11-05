def transpose(array)
  new_array = []
  (array[0].size).times do |idx|
    new_row = []
    array.each do |subarray|
      new_row << subarray[idx]
    end
    new_array << new_row
  end
  new_array
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], 
             [4, 3, 2, 1, 0], 
             [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]