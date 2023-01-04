def zip1(array1, array2)
  idx = 0
  result = Array.new
  while idx < array1.size
    new_element = []
    new_element << array1[idx]
    new_element << array2[idx]
    result << new_element
    idx += 1
  end
  result
end

def zip(array1, array2)
  array1.each_with_index.with_object([]) do |(element, idx), result|
    result << [array1[idx], array2[idx]]
  end
end


p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
