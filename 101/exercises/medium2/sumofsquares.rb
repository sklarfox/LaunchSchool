=begin
  initialize an array containing all integers from 1 to the given int
  get the square of the sum of the digits
  get the sum of the squares of the digits
    square all the digits
    add together
  subtract the two
=end

def sum_square_difference(num)
  numbers = (1..num).to_a
  square_of_sum = numbers.sum**2
  sum_of_squares = numbers.map { |n| n**2 }.sum
  square_of_sum - sum_of_squares
end


p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150