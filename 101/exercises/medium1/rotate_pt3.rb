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

def max_rotation(number)
  counter = number.digits.size
  loop do
    number = rotate_rightmost_digits(number, counter)
    counter -= 1
    break if counter == 0
  end
  number
end

  p max_rotation(735291) == 321579
  p max_rotation(3) == 3
  p max_rotation(35) == 53
  p max_rotation(105) == 15 # the leading zero gets dropped
  p max_rotation(8_703_529_146) == 7_321_609_845