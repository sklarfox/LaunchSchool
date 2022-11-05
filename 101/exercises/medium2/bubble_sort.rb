=begin
Problem: Implement a bubble sort algorithm in a method, which sorts an array in place

INput: array
output: none

Algorithm:
loop 
  Initialize two index counters to 0 and 1
  initialize a swapped variable to false

    compare the first two indexed elements
      If the first ones is greater than the second, swap the elements. Set swapped to true
    increment both idx counters by 1
    repeat until the second index is equal to array size - 1

break if swapped is false


=end

def bubble_sort!(array)
loop do
  idx1, idx2 = 0, 1
  swapped = false
  finish = array.size - 1

  loop do
    if array[idx1] > array[idx2]
      array[idx1], array[idx2] = array[idx2], array[idx1]
      swapped = true
    end
    idx1 += 1
    idx2 += 1

    if idx2 > finish
      finish -= 1
      break
    end
  end

  break if swapped == false
end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]


array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array  == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
