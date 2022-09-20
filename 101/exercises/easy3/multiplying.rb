def multiply(num1, num2)
  num1 * num2
end

multiply(5, 4)

def square(n1)
  multiply(n1, n1)
end

def power(number, power)
  total = 1
  power.times{total = multiply(total,number)}
  total
end