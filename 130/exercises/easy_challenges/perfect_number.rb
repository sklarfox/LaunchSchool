=begin
Problem:
  A perfect number is one whose divisors (excluding itself) add up to equal the number itself.
  An abundant number is one whose divisors add up to greater than the number
  A deficient number has divisors that add up to less than the number
  Write a program that returns what type of those 3 a number is
  Number can't be negative, should raise an error
Examples:

6 => Perfect. [1, 2, 3].sum == 6
15 => Deficient. [1, 3, 5].sum < 15
24 => Abundant. [1, 2, 3, 4, 6, 8, 12].sum > 24


Data Structure:

PefectNumber class
  static classify method, which returns a string of the type the number is. Takes 1 int as an argument
    raises a Standard Error if a non-natural number

  Use an array to hold divisors

Algorithm:

  Create an array containing all digits from 1 up to 1/2 the target digit
  Select all the digits who divide evenly into the target digit
  Sum those digits
  Compare to the target digit, return appropriate string

=end

class PerfectNumber
  def self.classify(int)
    raise StandardError if int < 1

    divisors = (1..(int / 2 + 1)).to_a.select { |divisor| int % divisor == 0 }
    
    case divisors.sum <=> int
    when -1 then 'deficient'
    when 0 then 'perfect'
    when 1 then 'abundant'
    end
  end
end