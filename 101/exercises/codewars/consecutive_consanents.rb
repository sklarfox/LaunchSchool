=begin
  input: string
  output: integer
  return the length of the longest consecutive run of vowels
  case insensitive
  
  algorithm:
    initialize an array to contain candidate substrings
    iterate from 0 up to and excluding string length
    search for the first vowel
      when found, search from the current index up to and excluding the string length
        when a consanant is found, add the substring from the first index up to the pervious idx2
        break
    return the largest candidate substring's size
=end



VOWELS = 'aeiou'

def solve(s)
 candidates = []
  (0...s.length).each do |idx1|
    next unless VOWELS.include?(s[idx1])
    ((idx1 + 1)...s.length).each do |idx2|

      break if !VOWELS.include?(s[idx2])
      candidates << s[idx1..idx2]
    end
  end
  return 1 if candidates.empty?
  candidates.max_by { |candidate| candidate.size }.size
end

p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8