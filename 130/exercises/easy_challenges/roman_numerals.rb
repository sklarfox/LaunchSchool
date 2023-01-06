=begin

Problem:
Write a RomanNumeral class, will take an int as an argument at instnatiation

Create a to_roman method, which will return a string containing the roman Numeral

Don't need to convert higher than 3000

Roman Numerals are expresse by expressing each digit from left to right, while skipping any zeroes

I = 1
V = 5
X = 10
L = 50
C = 100
D = 500
M = 1000

Ex:
Provided test cases

1024

MXXIV

Data Structure:
A Hash to contain the symbol for digits?


Algorithm:

Create a hash containing important conversions for roman numerals

initialize a results string
Iterate over each roman numeral, from largest to smallest
    while the current number is less than the roman numeral's numeric value
      subtract the value of the roman numeral from the total number
      add the roman numeral char to the results string

return the string
=end

ROMAN_NUMERALS = {
'M' => 1000,
'CM' => 900,
'D' => 500,
'CD' => 400,
'C' => 100,
'XC' => 90,
'L' => 50,
'XL' => 40,
'X' => 10,
'IX' => 9,
'V' => 5,
'IV' => 4,
'I' => 1 }

class RomanNumeral
  def initialize(number)
    @number = number
  end

  def to_roman_old
    result = ''
    target = @number
    ROMAN_NUMERALS.each do |roman, value|
      while target >= value
        target -= value
        result << roman
      end
    end
    result
  end

  def to_roman
    result = ''
    target = @number
    loop do
      symbol, value = ROMAN_NUMERALS.select { |_, value| value <= target }.max_by {|_,v| v }
      multiplier, remainder = target.divmod(value)
      result << symbol * multiplier
      target -= multiplier * value
      break if target == 0
    end

    result
  end
end