# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

=begin
P:
Input: array of integers
output: array of integers

Goal: Return an array of the same size, where each element is an integer that represents the number of other digits in the array which are smaller than the digit

Rules:
Explicit: duplicate numbers should be counted only once

Implicit:
  returne darray is always the same size as the first one

Algorithm:
create an array of all unique digits from the given array
iterate over the digits in the given array (map)
  count how many digits in the unique digit are less than the current digit from the main array

=end

def smaller_numbers_than_current(digits)
  unique_digits = digits.uniq
  digits.map do |digit|
    unique_digits.select { |unique| unique < digit }.size
  end
end

# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]