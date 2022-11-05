=begin

Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.

Good luck!

P:
Input: a string of integers
Output: Integer

Rules:
  digits can be rearranged into new order


Goal: return the number of substrings that represent a non-even digit

Algorithm:

Initialize an array to hold all substrings
Add all possible substrings to the array
  - use nested iteration
  - iterate from string's i 0, up to and excluding the size of the string
    - iterate j from 1 up to the size - starting index
      - add a substring to the array that goes from the index i, of length j
Select the ones that represent a non-negative integer
return the size of the on-negative ones

'1341' => 1(0, 1)  13(0, 2)  134(0,3)  1341(0,4)  3(1, 1)  34(1, 2) 341(1,3)  4(2, 1) 41(2, 2) 1 (3, 1)

=end

def solve(string)
  substrings = []
  (0...string.size).each do |idx|
    (1..(string.size - idx)).each do |length|
      substrings << string[idx, length]
    end
  end
  substrings.select { |substring| substring.to_i.odd? }.size
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20 
p solve("13472315") == 28