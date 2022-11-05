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


  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811
=end

def fibonacci(nth)
  return 1 if nth <= 2

  first = 1
  second = 1
  sum = nil

  (nth - 2).times do
    sum = first % 10 + second % 10 
    first = second
    second = sum % 10
  end

  sum

end

def fibonacci_last(nth)
  fibonacci(nth) % 10
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4