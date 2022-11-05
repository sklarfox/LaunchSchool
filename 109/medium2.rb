=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.


P:
Return true or false if a word doesn't both letters in any given block

Input: word
Output: True or False

Rules:
  - The word can't contain more than one letter from any single block
  implicit: case insensitive

E:
'BATCH' --> B:O, N:A, G:T, C:P, H:U --> true
'BUTCH' --> B:O, H:U --> H and U are on the same block so --> false
'jest' --> J:W, R:E, F:S, G:T

D:
Nested array for the given test blocks
[[B,O], [X,K], [D,Q], [C,P], [N,A]
[G,T], [R,E], [F,S], [J,W], [H,U]
[V,I], [L,Y], [Z,M]]

Algorithm:

Iterate through each test block
  check if the string contains in a given block
    return false
  return true

=end

TEST_BLOCKS = [['B','O'], ['X','K'], ['D','Q'], ['C','P'], ['N','A'],
['G','T'], ['R','E'], ['F','S'], ['J','W'], ['H','U'],
['V','I'], ['L','Y'], ['Z','M']]

def block_word?(string)
  TEST_BLOCKS.each do |block|
    return false if block.all? { |char| string.include?.upcase(char) }
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest')  == true




char_arr.each do |char|
  if char.match?(/[[:lower:]]/)
    hash_percentage[:lowercase] += 1
  elsif char.match(/[A-Z]/)
    hash_percentage[:uppercase] += 1
  else
    hash_percentage[:neither] += 1
  end
end







=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

P:
Return the next featured number after the given integer. A featured number is a number which is odd, is a multiple of 7, and each digit is unique.

Input: Integer
Output: An integer

A:
# Increment through digits starting at one greather than the given integer

# For each Integer from (given + 1) up to MAX
  # if it's odd
  # if it's multiple of 7
  # if it's composed of all unique digits
      # convert digits to an Array
      # remove duplicate digits from the Array
      # convert back to Integer
      # compare for equality to original digit
  # if all the above are true return that Integer
  # if number 10_000_000_000, return false

=end

MAX = 10_000_000_000

def multiple_7?(num)
  num % 7 == 0
end

def unique_digits?(num)
  num.digits.reverse.uniq.join.to_i == num
end

def featured(int)
  (int + 1..MAX).each do |num|
    if num.odd? && multiple_7?(num) && unique_digits?(num)
      return num
    end
  end
  puts "Error: No featured numbers greater than #{int}."
end


# test cases 
# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

 p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

