def double_odd_numbers(numbers)
  counter = 0
  doubled_odds = []

  loop do
    break if counter >= numbers.size
    
    current_number = numbers[counter]
    if counter.odd?
      doubled_odds << current_number * 2
    else
      doubled_odds << current_number
    end
    counter += 1
  end

  doubled_odds
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts double_odd_numbers(my_numbers) == [1, 8, 3, 14, 2, 12]

# not mutated
puts my_numbers == [1, 4, 3, 7, 2, 6]