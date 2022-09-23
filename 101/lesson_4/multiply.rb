def multiply(numbers, multiplier)
  new_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    new_numbers << current_number * multiplier
    counter += 1
  end

  new_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply(my_numbers, 3) == [3, 12, 9, 21, 6, 18]



=begin 
Input: array, integers
Output: array

explicit requirements
  - given an array and an integer as a multiplyer
  - must return a new array with every value multiplied by the factor

examples: see above

** algorithm **
initialize a new array to hold multiplied values
initialize a counter
select the first item in the array
multiply that value by 3
add that value to the new array
repeat for all items in the given array
return the new array


=end