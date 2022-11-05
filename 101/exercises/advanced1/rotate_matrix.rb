=begin
Input: nested array
output: nested array

Goal: return a matrix (nested array) of an arbitrary size which has been rotated 90 degrees clockwise.

Rules:
  If the matrix is n wide by m tall, returned one will be m wide by n tall


Examples: 

[1, 2] =>  [3, 1]
[3, 4]     [4, 2]
=end

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

def rotate90(array)
  transposed = transpose(array)
  rotated = transposed.map {|row| row.reverse }
end

def rotate(array, deg=90)
  (deg / 90).times { array = rotate90(array) }
  array
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))
new_matrix4 = rotate(matrix2, 360)

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
p new_matrix4 == matrix2