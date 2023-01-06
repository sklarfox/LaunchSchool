=begin

Problem:

Write a class Triangle that has a #kind method which will return what kind of triangle it is

input: 3 side lengths
output: a string, either equilateral, isosceles, or scalene
  equilateral: all 3 values the same
  isosceles: 2 sides are same length
  scalene: all 3 sides are different

algorithm
  verify that it is a valid triangle
    all 3 sides must be greater than zero
    the sum of any 2 sides must be greater than the other side
      sort the sides, see if the last is greater than the sum of the first two
  count how many unique side lengths there are in the triangle
    if 1 unique length, equilateral
      if 2 unique lengths, isosceles
        if 3 unique lengths, scalene
=end

class Triangle
  attr_reader :sides
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    raise ArgumentError unless valid?

  end

  def kind
    case sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

  private

  def valid?
    @sides.none? { |side| side <= 0 } && @sides.sort[0..1].sum > @sides.sort[2]
  end
end