# get required info from user
  # loan amount X
  # APR
  # loan duration

def valid_loan?(num)
  num == num.to_i.to_s
end

def valid_apr?(num)
  (num == num.to_f.to_s) || (num == num.to_i.to_s)
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