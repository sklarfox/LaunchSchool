# 4.Alphabet symmetry
# (https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0)
# 7 kyu
=begin
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

Good luck!

If you like this Kata, please try:
  
Last digit symmetry

Alternate capitalization

P:
Given an array of strings, return an array of the same size, where the number represents the number of characters in each string that are in the same position in the alphabet as they are in the string.

INput: An array of strings
Output: An array of integers

Rules: 
Explicit: count any character that is in the same position in the alphabet as in the string
Implicit: Case insensitive

Examples:
solve(["abode","ABc","xyzD"]) = [4, 3, 1] => 'abode' => 'a, b, d, e' => 4
['a', 'b', 'c', 'd', 'e'...]
['a', 'b', 'o', 'd', 'e']
"abode"

Data:
I: array
intermediate: nested array
O: array

Algorithm:
Initialize the alphabet as an array

For a single string:
Initilize an an array of lowercase characters from String
Initilize a counter variable to 0
Iterate through each character with index from the String
  - check for equality with element from the same index in the alphabet Array
  - if the same, incremement counter

=end
ALPHABET = ('a'..'z').to_a

def symmetry_count(string)
  characters = string.downcase.chars
  counter = 0
  characters.each.with_index do |char, idx|

    if char == ALPHABET[idx]
      counter += 1
    end
  end
  counter
end

def solve(array)
  array.map { |word| symmetry_count(word) }
end


p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"])  == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]