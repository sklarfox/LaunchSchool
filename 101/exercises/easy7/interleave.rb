def interleave2(array1, array2)
  joined_array = []
  idx = 0
  loop do
    joined_array << array1[idx]
    joined_array << array2[idx]
    idx += 1
    break if idx >= array1.size
  end
  joined_array
end

def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c'])  == [1, 'a', 2, 'b', 3, 'c']