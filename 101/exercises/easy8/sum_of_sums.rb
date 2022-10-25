=begin
  input: an array of integers
  output: a single integer

  problem: Take an array of integers, and sum up the totals of each subsequent digit and all preceding digits

  initialize a total variable to 0
  initialize a size counter variable to 1
  select size elements from the array starting with index 0
  sum those digits
  add that sum to the total
  increment the size counter
  repeat until size is equal to the size of the array

  return the final sum
=end

def sum_of_sums(digits)
  total = 0
  size = 1
  loop do
    total += digits[0, size].inject(:+)
    size += 1
    break if size > digits.size
  end
  total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35