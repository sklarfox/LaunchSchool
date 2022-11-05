=begin
input: integer, number of the position in the fibb. sequence we want returned
output: fibonacci value, integer


algorithm:
  # return 1 if nth is >= 2
  # initialize two variables to 1 as the first digits of the fibonacci sequence
  # initialize a sum variable
  # n times
    add the two numbers together, assign to sum variable
    assign second number to the first
    assign sum to the second number

  return the sum

=end

def fibonacci(nth)
  return 1 if nth <= 2

  first = 1
  second = 1
  sum = nil

  (nth - 2).times do
    sum = first + second
    first = second
    second = sum
  end

  sum

end

def fibonacci_last(nth)
  fibonacci(nth) % 10
end

# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4