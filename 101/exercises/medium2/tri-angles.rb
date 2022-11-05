=begin
P: Given 3 numbers that represent angles, return whether they make up a valid triangle (if so, which type), otherwise return invalid


Input: 3 numbers
Output: symbol, acute right obtuse or invalid

D: Array

Algorithm:

Add angles into an array

return invalid unless the sum is 180 and it doesn't contain zero

Find the maximum angle in the array
If it is 90, return :right
If its > 90, return :obtuse
If it's < 90, return acute

=end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  return :invalid unless angles.sum == 180 && !angles.include?(0)

  max_angle = angles.max

  if max_angle > 90
    return :obtuse
  elsif max_angle < 90
    return :acute
  else
    return :right
  end
end



p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid