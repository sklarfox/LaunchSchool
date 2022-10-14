def find_fibonacci_index_by_length(num)
index = 2
digit1 = 1
digit2 = 1
next_digit = 2
  until next_digit.digits.size == num
    next_digit = digit1 + digit2
    digit1 = digit2
    digit2 = next_digit
    index += 1
  end
  index
end




p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847