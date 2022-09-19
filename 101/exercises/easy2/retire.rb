# Get User age
print "What is your age? "
age = gets.chomp.to_i

# Get User retirement age
print "When would you like to retire? "
retirement_age = gets.chomp.to_i

# Calculate out how many years left
remaining = retirement_age - age

current_year = Time.new.year
retirement_year = current_year + remaining

# Print result
puts "It's #{current_year}. You will retire in #{retirement_year}"
puts "You have only #{remaining} years of work to go!"