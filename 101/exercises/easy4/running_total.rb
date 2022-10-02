=begin

# Problem ----------------------
input: an array of integers
output: an array of integers

create a method that creates a new array where each digit is the running total at that point in the original array

# Examples ---------------------

# Algorithm --------------------

create a running total variable
create an array to hold the running total values
for each item
  add to the running total
  add running total to the array
return the array

# Code -------------------------

=end

def running_total_old(array)
  total = 0
  totals = []
  array.each do |number|
    total += number
    totals << total
  end
  totals
end

def running_total(array)
  total = 0
  array.map { |number| total += number}
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []