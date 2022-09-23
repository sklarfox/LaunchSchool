def double_numbers!(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end
end

array = [1,2,3,4]
puts array.inspect
double_numbers!(array)
puts array.inspect