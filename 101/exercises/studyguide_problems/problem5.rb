# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

=begin
P:

explicit:
  case insensitive
  if multiple least frequent, return the first occuring
implicit:
    returned character should always be lowercase

Algorithm
downcase the string
initialize a least frequent letter variable to the first character
iterate over each character
    if the count of that character is less than the current least frequent, reassign the lowest to that character
return the least frequent char
=end

def least_common_char(string)
  string = string.downcase
  least_frequent = string[0]
  string.chars.each do |char|
    least_frequent = char if string.count(char) < string.count(least_frequent)
  end
  least_frequent
end
# Examples:

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".