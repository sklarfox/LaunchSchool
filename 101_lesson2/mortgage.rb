def valid_loan?(num)
  num == num.to_i.to_s
end

def valid_apr?(num)
  ((num == num.to_f.to_s) || (num == num.to_i.to_s))
end

def valid_duration?(num)
  num == num.to_i.to_s
end

# Gather loan amount
amount = ''
loop do 
  print "Please input loan amount: "
  amount = gets.chomp

  if valid_loan?(amount)
    break
  else
    puts "Invalid loan amount."
  end
end

# Gather APR
apr = ''
loop do
  print "Please input APR: "
  apr = gets.chomp

  if valid_apr?(apr)
    break
  else
    puts "Invalid APR."
  end
end

# Gather duration
duration_months = ''
loop do
  print "Please input loan duration in months: "
  duration_months = gets.chomp


  # Check for valid duration
  if valid_duration?(duration_months)
    # Ask for user verification of any value less than 12
    if duration_months.to_i < 12
      print "Usage: duration in months. Verify loan duration is #{duration_months} months (y/n): "
        verify = gets.chomp
        next unless verify.downcase == 'y'
    end
      
    break
  else
    puts "Invalid Duration."
  end
end

# Calculate payment
# Convert APR
monthly_rate = apr.to_f / 1200
payment = amount.to_i * (monthly_rate / (1 - (1 + monthly_rate)**(-duration_months.to_i)))

# Output result
puts ''
print "The monthly payment for a $#{amount}, #{duration_months} month loan @ #{apr}% is: "
puts "$%.2f" % payment