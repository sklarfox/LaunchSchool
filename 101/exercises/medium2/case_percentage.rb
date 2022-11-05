=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, 
as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: 
one represents the percentage of characters in the string that are lowercase letters, 
one the percentage of characters that are uppercase letters, and 
one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

P:
Goal: return a hash that containes the percentages of lowercase, uppercase and neither. Each percentage should be a key pair value
exp req: string will always have at least one char
         neither includes anything that isn't alphanumeric
         imp req: lowercase/uppercase/neither should be symbols
         whitespace is included in calculation
         percentages are a float, with 1 decimal of precision

Input: string
output: hash, 3 k/p values


Examples:
  'abCdef 123' #=> lowecase: 'abdef'  uppercase: 'C'   neither: ' 123'  #=>  lowercase: 5/10  uppercase: 1/10  neither: 4/10

Data:


Algorithm:
Initialize an array with lowercase  chars
Initialize an array with uppercase chars

initialize a results hash
get the total count of digits, assign to a variable
initialize a lower, upper, neither variable to 0

iterate through all the characters
  - if it's a lowercase char
    - increment lower by 1
  - elsif it's a unppercase character
    - increkment upper by 1
  - else
    -increment neither by 1

assign each counter variable as a percentage of the total number characters to it's respective symbol in the hash
return the results hash
=end

UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def letter_percentages(string)
  results = {}
  total_chars = string.length.to_f
  lowercase, uppercase, neither = 0, 0, 0
  
  string.chars.each do |char|
    if LOWERCASE.include?(char)
      lowercase += 1
    elsif UPPERCASE.include?(char)
      uppercase += 1
    else
      neither += 1
    end
  end

  results[:lowercase] = lowercase / total_chars * 100
  results[:uppercase] = uppercase / total_chars * 100
  results[:neither] = neither / total_chars * 100

  results
end

p letter_percentages('abCdef 123')  == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
