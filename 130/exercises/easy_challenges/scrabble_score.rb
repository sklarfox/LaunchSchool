require 'pry'
require 'pry-byebug'

=begin
Problem:
  Write a program that can calculate the score of a given scrabble word

  explicit requirements:
    each character has it's own score
    duplicates count towards the total
    whitespace should return zero
    case insensitive
    invalid words return zero



Examples:
See File

Data Structure:
Scrabble class
  constructor method, takes string as argument for the word
  score instance method
  score class method, for simple scoring without making a new object

  
Hash to tally chars, inject ot get scores?
Hash with point values for each char


Algorithm:
Make a hash containing point values for each char

convert string to an array of chars
tally up all the chars
reduce the hash to be the sum of all chars point value multiplied by count
return total

=end
SCORES = {'aeioulnrst' => 1,
          'dg' => 2, 
          'bcmp' => 3,
          'fhvwy' => 4,
          'k' => 5,
          'jx' => 8,
          'qz' => 10 }



class Scrabble
  def initialize(word)
    @word = word ? word : ''
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    @word.downcase.chars.tally.inject(0) do |sum, (char, count)|
      sum + letter_value(char) * count
    end
  end

  def letter_value(char)
    value = SCORES.select { |key, value| key.include?(char) }.values.first
    value ? value : 0
  end
end