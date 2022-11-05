=begin

  is a prime number?
    from 1 up to number/2
      if number % iteration == 0 return false
    true

  find the sum of the digits
  initialize a buffer variable to 0
  until the sum + buffer is prime
    increment buffer +=1

  return buffer

=end

def prime?(num)
  (2..(num / 2)).each do |iteration|
    return false if num % iteration == 0
  end
  true
end

def minimum_number(numbers)
  sum = numbers.sum
  buffer = 0
  until prime?(sum + buffer)
    buffer += 1
  end
  buffer
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2