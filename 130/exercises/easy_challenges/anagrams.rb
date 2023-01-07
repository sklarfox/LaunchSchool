=begin
Problem:
  Create an Anagram  class that takes a string as an argument
  Create a match method
    Input: array of strings
    output: array of 0 or more strings

    Explicit requirements:
      will return all strings which are an anagram
    Implicit requirements: 
      all letters must be included exacly once to be considered an anagram
      repeats dont count
      if no matches, return an empty array
      identical word isn't an anagram!!
      case insensitive

Data structure:
    Will have a collection of some kind to contain results
    Helper method for detecting an anagram


Algorithm:
      initialize a results array
      Iterate over each word in the array
        add it to the results array if it's an anagram (helper method)

    anagram helper method:
        false if the words are the same
        true if the chars sorted are the same for both
        false otherwise
=end

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(words)
    words.each.with_object([]) do |word, result| 
      result << word if anagram?(word)
    end
  end

  def anagram?(other)
    return false if @word.downcase == other.downcase
    @word.downcase.chars.sort == other.downcase.chars.sort
  end
end

