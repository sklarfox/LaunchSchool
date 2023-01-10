=begin
  Problem:
    Input: string
    output: an array of ints in nested arrays

  Rules:
    If you input a series lenght greater than the string length, throw an error


Data


Algorithm:

use two cursors
  initialize first cursor to 0
  initialize second cursor to size - 1

  until the second cursor is equal to the size of the string

=end


class Series
  def initialize(string)
    @digits = string.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError if size > @digits.size
    slice_start = 0
    slice_end = size - 1
    result = []
      while slice_end < @digits.size
        result << @digits[slice_start..slice_end]
        slice_start += 1
        slice_end += 1
      end
    result
  end

end