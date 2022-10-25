VOWELS = ['a', 'e', 'i', 'o', 'u']
CONSANANTS = (('a'..'z').to_a.delete_if { |char| VOWELS.include?(char) })

def double_consonants(string)
  doubled = ''
  string.chars.each do |char|
    CONSANANTS.include?(char.downcase) ? 2.times { doubled << char } : doubled << char
  end
  doubled
end

p double_consonants('String')  == "SSttrrinngg"
p double_consonants("Hello-World!")  == "HHellllo-WWorrlldd!"
p double_consonants("July 4th")  == "JJullyy 4tthh"
p double_consonants('') == ""