=begin
  input: integer
  output: integer

  return the nth fibonacci number. example 1 => 1, 

  base case
    return 1 if n == 1
    return 1 if n == 2

  recursive case
    fibonacci(n - 1) + fibonacci(n - 2)


=end


def fibonacci(n)
  # base cases
  return 1 if n == 1
  return 1 if n == 2

  # recursive case
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(40)
