def fizzbuzz(start, finish)
  (start..finish).each do |digit|
    output = ''
    output << 'Fizz' if digit % 3 == 0
    output << 'Buzz' if digit % 5 == 0
    output << digit.to_s if output.empty?
    puts output
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz