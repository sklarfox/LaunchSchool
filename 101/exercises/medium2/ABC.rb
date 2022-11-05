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