# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

=begin
Problem:
Input: array of integers
Input: array of 2 integers

goal: return the two integers that have the smallest difference in an array


rules:
explicit:
implicit:
  returned digits should be in the order they appear in the array
  arrays will always be at least 2 ints in size

  Algorithm:
    make an array that holds all pairs of digits as subarrays
      iterate from 0 up to and excluding (size - 1)
        iterate from the current index + 1 up to and excluding the size of the array
          add a subarray containing each ranges current value to the candidates array
    find the one with smallest difference

  
    [5, 25, 15, 11]
    [5, 25](0, 1) [5, 15](0, 2) [5, 11](0, 3) [25, 15](1, 2)  [25, 11](1, 3) [15, 11] (2, 3)

=end

def closest_numbers(digits)
  candidates = []
  (0...(digits.size - 1)).each do |idx1|
    ((idx1 + 1)...digits.size).each do |idx2|
      candidates << [digits[idx1], digits[idx2]]
    end
  end
  candidates.min_by { |pair| pair.sort.reverse.inject(:-) }
end

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".