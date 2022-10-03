arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

sorted_array = arr.sort_by do |subarray|
  subarray.reject {|x| x.even?}
end


p sorted_array == [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]