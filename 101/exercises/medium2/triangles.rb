=begin
P:
Input: 3 numbers (integer or float)
Output: symbol (equilateral, isosceles, scalene, invalid)

Given 3 sides, determine if it's a valid triangle, and if so which type, otherwise invalid

Rules:
all 3 sides the same: equilateral
2 sides the same: isosceles
3 diff sides: scalene

All must be more than zero
Sum of two shortest sides must be greater than the longest side


Examples:

Data:
Array

Algorithm:
- place all side values into an array
- sort the side lengths array
- return :invalid if any side is zero
- return :invalid if the longest side is greater than the sum of the other 2
  - check if the last item is greater than the first two

- determine how many unique side lengths are in the array
  - if 1, return :equilateral
  - if 2, return :isosceles
  - if 3, return : scalene

=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  sides = sides.sort
  return :invalid if sides.include?(0) || sides[-1] > sides[0..-2].sum

  case sides.uniq.size
  when 1 then return :equilateral
  when 2 then return :isosceles
  when 3 then return :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid