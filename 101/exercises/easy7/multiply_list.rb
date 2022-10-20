def multiply_list2(arr1, arr2)
  product_arr = Array.new(arr1.size)
  product_arr.map!.with_index do |num, idx| 
    arr1[idx] * arr2[idx]
  end
end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |arr| arr.inject(:*)}
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
