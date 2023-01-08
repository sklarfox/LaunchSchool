=begin
Problem:
  An octal number is a number in base-8
  Each digit gets multiplied by 8^n, where n is which position the number is from the right
      (reverse an array of digits? then idx is the power)
  Then sum those digits


  Rules:
    invalid strings are accepted, but converted to decimal return 0
    if 8 or 9 appear, they are invalid. return 0
    if any characters appear, it's invalid and should return 0 REGEX


Examples:



Data:

  Octal class
    constructor method takes a string representing an octal integer
    
    to_decimal method which converts octal to it's decimal equivalent
      this is the method that will verify if any invalid chars appear, if so return 0
      otherwise:

      initialize a total variable to 0
      turn the string into an int and get the digits (will be a reversed array, as we want)
      iterate over each digit with index
        add the digit * 8^idx to the total
      return the total



=end

class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if valid_octal?

    total = 0
    @octal.to_i.digits.each.with_index do |num, idx|
      total += num * 8**idx
    end
    total
  end

  private

  def valid_octal?
    @octal.match(/[^0-7]/)
  end
end