=begin
recreate the reverse! method, such that the array passed to 
the method is mutated so its elements are in reverse order


Algo:

swap the first element, idx 0 with the last element, idx -1
swap the next element idx 1 and idx -2
continue until the positive idx is greater than half the size of the array
return the array
=end

def reverse!(array)
  idx1 = 0
  idx2 = -1
  until idx1 == array.size / 2
    array[idx1], array[idx2] = array[idx2], array[idx1]
    idx1 += 1
    idx2 -= 1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true


list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true