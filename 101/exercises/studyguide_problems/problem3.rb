# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

=begin
goal: every 2nd character of every third word should be c onverted to upercase. everything else remains the same
input: string
output: string

rules:
  explicit:
    every second character of every third word is capitaized
  implicit:
    non-mutating
    if a word is only 1 character, no changes

Data;
    intermediate: arrays

Algorithm:
overall:
iterate over each word
    if its one of every third word, make it weird case
    otherwise use just the word as is
  join the words back into a string

weird case a word:
  iterate over each character
    if it's an odd index, upcase the character
    otherwise use the character as is

      
=end

def weirdize(word)
  word.chars.map.with_index do |char, idx|
    idx.odd? ? char.upcase : char
  end.join
end


def to_weird_case(words)
  words.split.map.with_index do |word, idx|
    (idx + 1) % 3 == 0 ? weirdize(word) : word
  end.join(' ')
end


# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".