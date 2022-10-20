=begin
  input: an array of integers
  output: a single integer

  problem: Take an array of integers, and sum up the totals of each subsequent digit and all preceding digits

  initialize a total variable to 0
  iterate through each item in the array with index
    sum up the digits in the array from 0 to the index, and add to the total sum
  return the final sum
=end

def sum_of_sums(digits)
  total = 0
  digits.each.with_index do |_digit, idx|
    total += digits[0, idx + 1].inject(:+)
  end
  total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35