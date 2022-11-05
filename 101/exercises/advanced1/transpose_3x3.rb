=begin
Transpose an array. Given a 3x3 array, each column should be made into a row

input: array
output: array

data: array

algorithm:
initialzie a new array

iterate as many times as there are elements in the array
  initialize a new row subarray
  iterate through each item in the array
    add the (main iterations index) indexed item to new row
  add the new row new array

  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

Algorith: transpose!
swap every element with it's reflected counterpart (ex. item at location [0][1] is switched with [1][1])
on the first row, start flipping elements at the 0 idx item to the end
on the second row, start flipping at the 1 idx item to the end
...
repeat until the final row

iterate over each element with index
  iterate from that index up to the size of the row
    swap elements with it's mirrored counterpart
=end

def transpose(array)
  new_array = []
  (array.size).times do |idx|
    new_row = []
    array.each do |subarray|
      new_row << subarray[idx]
    end
    new_array << new_row
  end
  new_array
end

def transpose!(array)
  array.each.with_index do |row, idx1|
    (idx1...array.size).each do |idx2|
      array[idx1][idx2], array[idx2][idx1] = array[idx2][idx1], array[idx1][idx2]
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
transpose!(new_matrix)

p new_matrix == matrix