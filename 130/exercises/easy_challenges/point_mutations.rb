=begin
Problem:

Create a DNA class
  will accept one string as an argument

Create a hamming_distance method
  will accept one string as an argument (the other DNA strand) May be different length

  initialize a counter to 0
  find the length of the shorter string
  iterate from 0 up to and excluding the shorter string length
    increment the counter for each char there is a difference
  return counter


Data:
  DNA will be stored as a string
  In comparison, convert both strings to arrays
=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    length_to_check = [strand, other_strand].map(&:length).min
    (0...length_to_check).each do |idx|
      distance += 1 if strand[idx] != other_strand[idx]
    end
    distance
  end
end
