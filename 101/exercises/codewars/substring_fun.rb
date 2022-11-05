=begin
Complete the function that takes an array of words.
You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.
For example:
["yoda", "best", "has"] --> "yes" ^^^
n=0 n=1 n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters. 


Problem:
goal: given an array, return a string where each character is the nth character in each element, where n is the index of the string in the array

input: array of strings
output: string

rules:
explicit: each letter is the same index as the element in the array
implicit: an empty array should return an empty string
          case sensitive, the characters should retain the same case

algo:
initialize a result string
iterate with index over each element
    concatenate each character from the string at the same index
return the string
=end

def nth_char(strings)
  result = ''
  strings.each.with_index do |string, idx|
    result << string[idx]
  end
  result
end


p nth_char(['yoda', 'best', 'has']) == 'yes' 
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'