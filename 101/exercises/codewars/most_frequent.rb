=begin
Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.
Assumptions:
A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)
Matches should be case-insensitive, and the words in the result should be lowercased.
Ties may be broken arbitrarily.
If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.
Examples:
top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]
top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") # => ["e", "ddd", "aa"]
top_3_words(" //wont won't won't") => ["won't", "wont"]
Bonus points (not really, but just for fun):
Avoid creating an array whose memory footprint is roughly as big as the input text. Avoid sorting the entire array of unique words.

Problem: Given a string of text, return the top 3 more frequent words (or 2, 1 or 0 if fewer than 3 repeating words)

Input: string
output: array of strings

rules:
explicit:
  case insensitive
    return fewer words if less than 3 repeating characters
    word contains a-z chars and could contain one or more apostraphe
    words are designated by either punctuation or white space
    returned words should be sorted by number of occurences, largest to smallest
    word instances are case sensitive (ex. Aa is the same as aa). returned string should be all lowercase
implicit
  special characters within a text (for ex an apostrophe) create a new word. ex. won't is different than wont
  don't have to account for hyphenation or other special chars
  numbers aren't included

Data Structure
input: string
intermediate: Hash
output: array

Algorithm:
      delete all the punctuation and split up the words by whitespace. assign to an array
      initialize a hash to contain seen words
      iterate through each word
        if it's in the hash
          increment that word's count
        otherwise
          initialize that words key value pair to 1
      select the top 3 entries form the hash by value
      sort the top 3 hash?
      return the top 3 hash's keys as an array
=end

def top_3_words(words)
  words = words.downcase.delete("^a-z' ").split(' ')
  seen_words = {}
  words.each do |word|
    next if word.delete("'").empty?
    if seen_words.has_key?(word)
      seen_words[word] += 1
    else
      seen_words[word] = 1
    end
  end
  seen_words.max_by(3) { |k,v| v }.to_h.keys
end

p top_3_words("a a a b c c d d d d e e e e e")==["e","d","a"]

p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"] 
p top_3_words(" //wont won't won't ") == ["won't", "wont"]
p top_3_words(" , e .. ") == ["e"]
p top_3_words(" ... ") == []
p top_3_words(" ' ") == []
p top_3_words(" ''' ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]
