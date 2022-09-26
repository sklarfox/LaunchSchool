=begin

# Problem ----------------------
- create a function that takes 2 strings as an argument
- the function should return a new string, which is the concatenation of the short string, then the long, and then the short again

# Examples ---------------------
puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"

# Algorithm --------------------
initialize a new variable for the shorter string
if word1 is shorter
  set short to word1 and long to word2
else
  set short to word2 and long to word1
set short to the shorter string
set long to the other string

initialize a new empty string
  add the short
  add the long
  add the short

return the string

=end

# Code -------------------------

def short_long_short(word1, word2)
  if word1.length <= word2.length
    short, long = word1, word2
  else
    short, long = word2, word1
  end
  short + long + short
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"