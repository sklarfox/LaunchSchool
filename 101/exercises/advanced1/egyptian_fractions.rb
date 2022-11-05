=begin
******* Egyptian *******
  Input: Array of 2 integers, representing a single rational number
  Output: Array of integers. Each integer represents the denominator in the egyptian fraction

  Goal: Given a rational number, return an array representing the digits of the denominators in a valid egyptian fraction.

  Explicit:
    - An infinite number of egyptian fracdtions for any given rational number
    - All numerators must start with one (be unit fraction)


  Algorithm:
      - initialize a results array
      - Iterate over whole numbers, starting with 1, until leftovers is 0
        - Skip to the next one if f leftover - (1 / iteration) is less than 0
        - otherwise, 
        # - add the iteration to the array of denominators
        # - subtract (1 / iteration) from leftovers
        # - loop until leftovers is 0
      -return the results array

ex. (2, 1)
[1, 2, 3, 6]
  leftover is 2/1
  2/1 - 1/1 = 1/1
  leftover is now 1/1
  1/1 - 1/2 = 1/2
  1/2 - 1/3 = 1/6
  1/6 - 1/6 = 0


  ****** Unegyptian ********
  Given an array of integers, return the resulting sum of all elements where the element is the denominator in a unit fraction

  turn all elements into a rational number
  sum them together


=end

def egyptian(number)
  results = []
  current_denominator = 1

  until number == 0
    unless number - Rational(1, current_denominator) < 0
      results << current_denominator
      number -= Rational(1, current_denominator)
    end
    current_denominator += 1
  end
  results
end 

def unegyptian(array)
  array.map { |denom| Rational(1, denom) }.inject(:+)
end

# p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)