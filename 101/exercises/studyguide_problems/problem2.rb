# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.
=begin
P:
Goal: return the smallest sum of any 5 consecutive digits

Input: an array of integers
output: integer or nil

rules:
if fewer than 5 digits, return nil

algo:
if the array is smaller than 5, return nil
initialize an array to hold candidate sums
iterate from 0 up to (size of the array - 5)
  find the sum of the next 5 digits, add to candidate array
return the minimum from the candidates


=end

def minimum_sum(digits)
return nil if digits.size < 5
candidates = []
(0..(digits.size - 5)).each do |idx|
  candidates << digits[idx, 5].sum
end
candidates.min
end
# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".