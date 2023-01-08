=begin
Problem:
  Create a program that can generate the lyrics to 99 bottles of beer song
  verse lines should be split onto two lines. if multiple, separated by a blank line (\n\n)


Data:
  BeerSong class
    no constructor method

  verse class method
    create the line for a specific lyric
    special case: 2
    special case: 1
    special case: 0

  verses class method
      accept two arguments, a range of lines to generate

  lylrics class method
    creates all the lyrics

  String interpolation
      special cases for bottle/bottles
    when it's two bottles, the second line will be singular
    when it's one bottle, the first line will be singular

  Hash with default value for bottle/bottles lookup?

Algorithm:

      verse
        takes 1 argument, an integer
        outputs a string for the lyric
        
        assign a string for plural or singular, conditional on if the value is 1 or not
=end

class BeerSong
  PLURAL = Hash.new('bottles')
  PLURAL[1] = 'bottle'

  def self.verse(num)
    case num
    when 1
      "#{num} #{PLURAL[num]} of beer on the wall, #{num} #{PLURAL[num]} of beer.\n" \
      "Take it down and pass it around, no more #{PLURAL[num - 1]} of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{num} #{PLURAL[num]} of beer on the wall, #{num} #{PLURAL[num]} of beer.\n" \
      "Take one down and pass it around, #{num - 1} #{PLURAL[num - 1]} of beer on the wall.\n"
    end
  end

  def self.verses(high, low)
    result = []
    high.downto(low).each do |num|
      result << verse(num)
    end
    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
