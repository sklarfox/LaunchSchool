=begin
input: a 6 digit integer, and a number
output: a 6 digit integer

problem: take a 6 digit integer, and rotate the last N digits. Return the full integer with
         rotated digits

algorithm:
convert the integer to an array of digits
partition the array into two separate arrays, such that the second array (back digits) is length N
rotate the second array
combine the arrays and join the digits
convert back to an integer
=end

def rotate_array(array)
  rotated = array.clone
  rotated << rotated.shift
end

def rotate_rightmost_digits(number, n)
  digits = number.digits.reverse
    left, right = digits.partition.with_index { |_, idx| idx < digits.size - n }
    rotated = left + rotate_array(right)
    rotated.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


