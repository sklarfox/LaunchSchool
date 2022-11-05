=begin
initialize a max and count variable
iterate through each character
  if it is a vowel, increment counter
  if it is a consanant
    set max to be counter if counter is larger than current max
    set counter to 0
=end

def solve(string)
  counter, max = 0, 0
  string.chars.each do |char|
    if 'aeiou'.include?(char)
      counter += 1
      if counter > max
        max = counter
      end
    else
      counter = 0
    end
  end
  max
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5 
p solve("iiihoovaeaaaoougjyaw") == 8