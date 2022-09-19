# Ask user for bill amount
print "What is the total bill? "
bill = gets.chomp.to_f
# Ask user for tip percentage
print "What is the tip percentage? "
percent = (gets.chomp.to_i) / 100.0
# Calculate out tip amount
tip = bill * percent
total = bill + tip

# Format values
tip = format("%.2f", tip)
total = format("%.2f", total)

# Print tip amount
puts "Tip: #{tip}"

# Print total amount
puts "Total: #{total}"