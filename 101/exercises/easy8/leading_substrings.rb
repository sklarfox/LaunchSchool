=begin



=end

def leading_substrings(string)
  substrings = []
  counter = 1
  loop do
    substrings << string[0, counter]
    counter +=1
    break if counter > string.size
  end
  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']