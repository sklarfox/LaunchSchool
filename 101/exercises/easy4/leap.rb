=begin

# Problem ----------------------
input: integer
output: bool

Determine if a given year is a leap year

if year is divisible by 4, it could be a leap year
  unless it's divisible by 100
    unless it's divisible by 400

# Examples ---------------------
year factors
      if 4, and 400, then it's a leap year
      if 4 and 100, then not a leap year
      if 4 and not 100, then a leap year

# Data Structures --------------

# Algorithm --------------------

# Code -------------------------

=end
def factor(num, factor)
  num % factor == 0
end

def leap_year_old?(year)
  factor(year, 4) ^ (factor(year, 100) ^ factor(year, 400))
end

def leap_year?(year)
  (year % 4 == 0) ^ ((year % 100 == 0) ^ (year % 400 == 0))
end


p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true