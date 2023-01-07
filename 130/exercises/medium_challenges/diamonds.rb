=begin
Problem:
  The diamond should be vertically symetrical
  The first row has a centered 'A'
  Each row has 2 chars on either edge of the diamond, which is the next letter in the alphabet
  Rows continue up to the char given as an argument
  Repeats, except in decending chars and width, down to a single centered 'A'
  same height as width

Examples:

A

  A
 B B
C   C
 B B
  A

    A     =>  0 spaces
   B B    =>  1 space
  C   C   =>  3 spaces
 D     D  =>  5 spaces
E       E =>  7 spaces
 D     D
  C   C
   B B
    A

Data:
  Diamond class

  make_diamond class (static) method

  Input and outputs are both strings
  Maybe use arrays?

Algorithm:

  return 'A' if the target char is 'A'
  Get the count of how many rows need to be built based of the argument char (char.ord - 64)
  Calculate the width of the diamond ((char.ord - 66) * 2 + 1)
  Initialize a new array to hold rows
  Initialize a middle_gap variable to 1

  Iterate from 'A' up to target char
    Start with the first row, add a single 'A' centered on the width
    Add the next row, a 'B' with the spacer number of spaces followed by another 'B'
    Increment middle_gap by 2
    Repeat up to target char
  
  Iterate from second to last char down to A
    same stuff but downwards. TODO

  Join the array with '\n' and return that
    
=end

class Diamond
  def self.make_diamond(target_char)
    return "A\n" if target_char == 'A'

    distance_to_middle = target_char.ord - 64
    width = (target_char.ord - 66) * 2 + 3
    middle_gap = 1
    result = []

    ('A'..target_char).to_a.each do |char|
      next if char == target_char
      if char == "A"
        result << char.center(width) + "\n"
      else
        result  << (char + (' ' * middle_gap) + char).center(width) + "\n"
        middle_gap += 2
      end
    end

    ('A'..target_char).to_a.reverse.each do |char|
      if char == "A"
        result << char.center(width) + "\n"
      else
        result  << (char + (' ' * middle_gap) + char).center(width) + "\n"
        middle_gap -= 2
      end
    end

    result.join
  end
end

puts Diamond.make_diamond('E')