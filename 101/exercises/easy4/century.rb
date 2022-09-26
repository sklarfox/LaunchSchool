=begin

# Problem ----------------------
explicit: return a string that is the appropriate century with the correct suffix appended to it

# Examples ---------------------

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

# Data Structures --------------
hash for ending number

# Algorithm --------------------
create a century variable
take the input year as an integer, add 99, divide by 100 to get the century
identify the last digit of the century number
  append the appropriate suffix to the century number
  case last digit
    1, st
    2, nd
    3, rd
    4+ th
return the full century


# Code -------------------------

=end

def century(year)
  century_num = (year + 99) / 100
  last_digit = century_num % 10
  case last_digit
  when 1
    century = "#{century_num}st"
  when 2
    century = "#{century_num}nd"
  when 3
    century = "#{century_num}rd"
  else
    century = "#{century_num}th"
  end
end


p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'