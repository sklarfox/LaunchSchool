=begin
P:
Input string
output true/false

Return true if all the parentheses are balanced, i.e. in matching pairs
There must be an equal number of open and  close parentheses
The first must be an open, last must be close
If no parentheses, return true

Examples:
balanced?('((What) (is this))?') == true  ( count is 3, ) count 3, first is (, last is )
balanced?('((What)) (is this))?') == false ( count is 3, ) count is 4

Data:
Strings, possibly an array

Algorithm:
  delete everything except for parentheses from the string
  compare the count of open and closed parentheses, if they're unequal return false
  if the first isn't ( and last isn't ), return false
    true
=end



def balanced?(string)
  parentheses_only = string.delete('^()')
  return true if parentheses_only.empty?
  return false unless parentheses_only.count('(') == parentheses_only.count(')')
  return false unless parentheses_only[0] == '(' && parentheses_only[-1] == ')'
  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
