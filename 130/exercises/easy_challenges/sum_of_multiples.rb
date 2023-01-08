=begin
  Problem:
    Given a natural number along with a set of 1 or more other numbers
    Find the sum of all the multiples of less than the first number, which are a multiple of any number in the set
    If only one number given, use a default value of 3 and 5 for the multiples set


  Example:
    20, [3, 5] => multiples [3, 5, 6, 9, 10, 12, 15, 18] Sum is 78

  Data Structure:
    SumofMultiples class
      constructor method takes any number of arguments, to be the multiple of numbers (splat operator)

    #to static method
    takes one number as an argument, the max number
      uses default values of 3 and 5 for the second set of numbers

    #to instance method
      takes one number as an argument, uses numbers in the instance variable assigned at instantiation

    Use a collection to hold the multiples

    Use a collection to hold the results

  Algorithm:

    static method
    Use the instance method version, with [3, 5] at instantiation

    instance method

      initialize a result array
      iterate over [3, 5] with an object
        assign to a working variable
        while the current number is < target number
          add the number to the results array
          add the number to itself
      sum the unique elements of the result, return that value
=end

class SumOfMultiples
  attr_reader :multiples

  def initialize(*args)
    @multiples = args
  end

  def to(max)
    result = []
    multiples.each do |multiple|
      working_value = multiple
      while working_value < max
        result << working_value
        working_value += multiple
      end
    end
    result.uniq.sum
  end

  def self.to(max)
    self.new(3, 5).to(max)
  end
end